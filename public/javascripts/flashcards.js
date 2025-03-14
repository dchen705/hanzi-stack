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

function selectTabs(tabclass) {
  document.querySelectorAll(tabclass).forEach(tab => {
    tab.checked = true;
  })
}

function updateCard() {
  let currentCard = flashcards[currentIndex]
  hanzi.textContent = currentCard.hanzi;
  pinyin.textContent = currentCard.pinyin;
  meaning.textContent = currentCard.meaning;
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
};

function enableButton(button) {
  button.style.opacity = 1;
  button.disabled = false;
}

function firstCard() {
  return currentIndex === 0;
}

function lastCard() {
  return currentIndex >= flashcards.length - 1;
}

document.addEventListener('DOMContentLoaded', function() {
  const tabContainers = document.querySelectorAll('.tabs');
  const tabs = document.querySelectorAll('.tabs input');

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
      selectTabs(`.${this.className}`)
    });
  });

  prevButton.addEventListener('click', function() {
    currentIndex -= 1;
    resetCardFace();
    updateCard();
    enableButton(nextButton);
    if (firstCard()) { disableButton(prevButton); };
  });

  nextButton.addEventListener('click', function() {
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
        selectTabs(`.tab${e.key}`);
        break;
    }
  });
});

