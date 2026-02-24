document.addEventListener('DOMContentLoaded', function() {
  const reviewLink = document.querySelector('.deck-review-link');
  const deckId = reviewLink.getAttribute('data-deck-id');
  const removeLink = document.querySelector('.deck-remove-link');
  const renameLink = document.querySelector('.deck-rename-link');
  const renameDialog = document.querySelector('dialog.rename-deck');
  const renameCancel = document.querySelector('button.rename-deck-cancel');
  const flashcardsContainer = document.querySelector('.container-flashcards');

  reviewLink.addEventListener('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    window.location.href = `/flashcards/${deckId}`;
  });

  removeLink.addEventListener('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    const userConfirmed = confirm('Are you sure you want to delete this deck?');

    if (userConfirmed) {
      const confirmInput = document.createElement('input');
      confirmInput.type = 'hidden';
      confirmInput.name = 'confirm';
      confirmInput.value = 'true';

      const form = document.querySelector('form.deck-remove');

      form.appendChild(confirmInput);

      form.submit();
    }
  });

  renameLink.addEventListener('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    renameDialog.showModal();
  });

  renameCancel.addEventListener('click', function() {
    renameDialog.close();
  });

  if (flashcardsContainer) {
    flashcardsContainer.addEventListener('click', function(event) {
      const button = event.target.closest('.flashcard-remove-button');

      if (!button) return;

      event.preventDefault();
      event.stopPropagation();

      const characterId = button.getAttribute('data-character-id');
      const deckIdForCard = button.getAttribute('data-deck-id');

      if (!characterId || !deckIdForCard) return;

      const flashcard = button.closest('.flashcard');

      fetch('/deck/edit/remove', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
        },
        body:
          'deck-id=' + encodeURIComponent(deckIdForCard) +
          '&character-id=' + encodeURIComponent(characterId)
      })
        .then(function(response) {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }

          if (flashcard) {
            flashcard.remove();
          }

          if (!flashcardsContainer.querySelector('.flashcard')) {
            flashcardsContainer.innerHTML =
              '<p class="text-body-secondary">This deck has no cards yet.</p>';
          }
        })
        .catch(function() {
          alert('Could not remove card from deck. Please try again.');
        });
    });
  }
});