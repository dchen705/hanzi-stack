document.addEventListener('DOMContentLoaded', function() {
  const deckForm = document.querySelector('.deck-form');
  const addDeckButton = document.querySelector('button.deck-add');
  const reviewButton = document.querySelector('button.deck-review');
  const dialog = document.querySelector('dialog');
  const cancelButton = document.querySelector('button.deck-add-cancel');
  const loggedIn = document.querySelector('a[href="/logout"]') != null;
  let reviewButtonClicked = false;

  addDeckButton.addEventListener('click', () => {
    if (loggedIn) {
      dialog.showModal();
    } else {
      alert('Please login to add a deck.')
    }
  });

  cancelButton.addEventListener('click', () => {
    dialog.close();
  });

  reviewButton.addEventListener('click', function(event) {
    if (!deckForm.reportValidity()) {
      return;
    }
    event.preventDefault();
    let deckId = document.querySelector('input[name="deck-id"]:checked').value;
    window.location.href = `/flashcards/${deckId}`;
  });
});


