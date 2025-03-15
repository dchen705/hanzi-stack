// Array(3) [ {…}, {…}, {…} ]
// ​
// 0: Object { hanzi: "一", pinyin: "yī", meaning: "one; a, an; alone" }
// ​
// 1: Object { hanzi: "七", pinyin: "qī", meaning: "seven" }
// ​
// 2: Object { hanzi: "丁", pinyin: "dīng", meaning: "male adult; robust, vigorous; 4th heavenly stem" }
// ​
// length: 3
// const flashcards = <%== @flashcards.to_json %>;
let currentIndex = 0;

const hanzi = document.querySelector('.hanzi');
const pinyin = document.querySelector('.pinyin');
const meaning = document.querySelector('.meaning');
const cardContainer = document.querySelector('.cardface-container');
const prevButton = document.querySelector('button.prev');
const nextButton = document.querySelector('button.next');
const tabContainers = document.querySelectorAll('.tabs');
const tabs = document.querySelectorAll('.tabs input');

function selectBothSidesTab(tabclass) {
  document.querySelectorAll(tabclass).forEach(tab => {
    tab.checked = true;
  })
}

function updateCard() {
  let currentCard = flashcards[currentIndex]
  hanzi.textContent = currentCard.hanzi;
  pinyin.textContent = currentCard.pinyin;
  meaning.textContent = currentCard.meaning;
  selectBothSidesTab(`.tab${currentSavedProficiency()}`);
}

function resetCardFace() {
  cardContainer.style.transition = 'none';
  cardContainer.classList.remove('flipped');
  setTimeout(() => {
    cardContainer.style.transition = 'transform .5s';
  }, 500)
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

function updateProficiency() {
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

document.addEventListener('DOMContentLoaded', function() {
  disableButton(prevButton);
  updateCard();
  if (lastCard()) {
    disableButton(nextButton);
  };

  cardContainer.addEventListener('click', function() {
    this.classList.toggle('flipped');
  });

  tabContainers.forEach(container => {
    container.addEventListener('click', function(event) {
      event.stopPropagation();
    });
  });

  tabs.forEach(tab => {
    tab.addEventListener('change', function() {
      selectBothSidesTab(`.${this.className}`)
    });
  });

  prevButton.addEventListener('click', function() {
    if (currentSavedProficiency() != null ) {
      updateProficiency();
    }
    currentIndex -= 1;
    resetCardFace();
    updateCard();
    enableButton(nextButton);
    if (firstCard()) { disableButton(prevButton); };
  });

  nextButton.addEventListener('click', function() {
    if (currentSavedProficiency() != null ) {
      updateProficiency();
    }
    currentIndex += 1;
    resetCardFace();
    updateCard();
    enableButton(prevButton);
    if (lastCard()) { disableButton(nextButton); };
  });

  window.addEventListener('keydown', function(e) {
    switch (e.key) {
      case 'w':
        cardContainer.classList.toggle('flipped');
        break;
      case 'a':
        prevButton.click();
        break;
      case 'd':
        nextButton.click();
        break;
      case '1':
      case '2':
      case '3':
        selectBothSidesTab(`.tab${e.key}`);
        break;
    }
  });
});

