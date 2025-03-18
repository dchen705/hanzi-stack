// CONSTANTS
const hanzi = document.querySelector('.hanzi');
const pinyin = document.querySelector('.pinyin');
const meaning = document.querySelector('.meaning');
const cardContainer = document.querySelector('.cardface-container');
const quitLink = document.querySelector('.quit-link');
const prevButton = document.querySelector('button.prev');
const nextButton = document.querySelector('button.next');
const shuffleButtons = document.querySelectorAll('.shuffle-btn');
const tabContainers = document.querySelectorAll('.tabs');
const tabs = document.querySelectorAll('.tabs input');
const cardIndex = document.querySelector('span.card-index');

let currentIndex = 0;

// FUNCTIONS
// DOM Getters/Readers
function firstCard() {
  return currentIndex === 0;
}

function lastCard() {
  return currentIndex >= flashcards.length - 1;
}

function currentSavedProficiency() {
  return flashcards[currentIndex].proficiency;
}

function newSelectedProficiency() {
  return document.querySelector('.tabs input:checked').className.slice(-1);
}

// DOM Writes/Manipulation
function updateCardIndex() {
  cardIndex.textContent = currentIndex + 1;
}

function disableButton(button) {
  button.style.opacity = 0;
  button.disabled = true;
  button.style.cursor = 'default';
};

function enableButton(button) {
  button.style.opacity = 1;
  button.disabled = false;
  button.style.cursor = 'pointer';
}

function selectBothSidesTab(tabclass) {
  document.querySelectorAll(tabclass).forEach(tab => {
    tab.checked = true;
  })
}

function resetCardFace() {
  cardContainer.style.transition = 'none';
  cardContainer.classList.remove('flipped');
  setTimeout(() => {
    cardContainer.style.transition = 'transform .5s';
  }, 500)
}

function initializeFirstCard() {
  disableButton(prevButton);
  currentIndex = 0;
  updateCard();
  if (lastCard()) {
    disableButton(nextButton);
  } else {
    enableButton(nextButton);
  }
}

function swipeCardInView() {
  setTimeout(() => {
    cardContainer.style.transition = 'none';
    cardContainer.classList.remove('swiped-left');
    cardContainer.classList.remove('swiped-right');
    cardContainer.style.transition = 'transform .25s';
  }, 25);
}

function updateCard() {
  let currentCard = flashcards[currentIndex]
  hanzi.textContent = currentCard.hanzi;
  pinyin.textContent = currentCard.pinyin;
  meaning.textContent = currentCard.meaning;
  if (currentSavedProficiency() != null ) {
    selectBothSidesTab(`.tab${currentSavedProficiency()}`);
  }
  resetCardFace();
  updateCardIndex();
}

function shuffleCards(cards) {
  for (let i = cards.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [cards[i], cards[j]] = [cards[j], cards[i]];
  }
  return cards;
}

function rearrangeToOriginalOrder() {
  flashcards.sort((a, b) => a.originalIndex - b.originalIndex);
}

// Backend Writes/Updates
function updateProficiency() {
  if (currentSavedProficiency() == null ) {
    return;
  }
  let currentCard = flashcards[currentIndex];
  let newProficiency = newSelectedProficiency();
  if (currentSavedProficiency() != newProficiency) {
    fetch('/flashcards/proficiency/edit', {
      method: 'POST',
      headers: {
        'Content-Type': "application/x-www-form-urlencoded"
      },
      body: 'id=' + flashcards[currentIndex].id + '&proficiency=' + newProficiency
    }).then(response => {
        currentCard.proficiency = newProficiency;
    })
  }
}

// Event Handlers
function handlePrevButtonClick() {
  updateProficiency();
  cardContainer.classList.add('swiped-left');
  currentIndex -= 1;
  updateCard();
  swipeCardInView();
  enableButton(nextButton);
  if (firstCard()) {
    disableButton(prevButton);
  }
}

function handleNextButtonClick() {
  updateProficiency();
  cardContainer.classList.add('swiped-right');
  currentIndex += 1;
  updateCard();
  swipeCardInView();
  enableButton(prevButton);
  if (lastCard()) {
    disableButton(nextButton);
  };
}

function handleQuitLinkClick(event) {
  event.preventDefault();
  updateProficiency()
  setTimeout(() => {
    window.location.href = quitLink.href;
  }, 50)
}

function handleShuffleButtonClick(event) {
  const button = event.currentTarget;
  event.stopPropagation();
  updateProficiency();
  shuffleButtons.forEach(button => {button.classList.toggle('active')})
  if (button.classList.contains('active')) {
    flashcards = shuffleCards(flashcards);
  } else {
    rearrangeToOriginalOrder();
  }
  initializeFirstCard();
}

function handleKeyDown(event) {
  switch (event.key) {
    case 'q':
      quitLink.click();
      break;
    case 'w':
      cardContainer.classList.toggle('flipped');
      break;
    case 'a':
      prevButton.click();
      break;
    case 'd':
      nextButton.click();
      break;
    case 's':
      shuffleButtons[0].click();
      break;
    case '1':
    case '2':
    case '3':
      selectBothSidesTab(`.tab${event.key}`);
      break;
  }
}

// EXECUTION FLOW
document.addEventListener('DOMContentLoaded', function() {
  initializeFirstCard();

  // Add originalIndex to each flashcard to enable unshuffle
  flashcards.forEach((flashcard, index) => {
    flashcard.originalIndex = index;
  });

  cardContainer.addEventListener('click', function() {
    this.classList.toggle('flipped');
  });

  tabContainers.forEach(container => {
    container.addEventListener('click', function(event) {
      event.stopPropagation();
    })
  })

  tabs.forEach(tab => {
    tab.addEventListener('change', function() {
      selectBothSidesTab(`.${this.className}`)
    });
  });

  shuffleButtons.forEach(button => {
    button.addEventListener('click', handleShuffleButtonClick);
  })
  prevButton.addEventListener('click', handlePrevButtonClick);
  nextButton.addEventListener('click', handleNextButtonClick);
  quitLink.addEventListener('click', handleQuitLinkClick);
  window.addEventListener('keydown', handleKeyDown);
});
