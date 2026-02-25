document.addEventListener('DOMContentLoaded', function() {
  const container = document.querySelector('.container-flashcards');

  if (!container) return;

  const emptyStateHtml = [
    '<p class="text-body-secondary">Currently no cards in your stack.</p>',
    '<a class="tab" href="/search/characters">Search Characters</a>'
  ].join('');

  container.addEventListener('click', function(event) {
    const button = event.target.closest('.flashcard-remove-button');

    if (!button) return;

    event.preventDefault();
    event.stopPropagation();

    const cardId = button.getAttribute('data-card-id');

    if (!cardId) return;

    const flashcard = button.closest('.flashcard');

    fetch('/stack/remove', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
      },
      body: 'id=' + encodeURIComponent(cardId)
    })
      .then(function(response) {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }

        if (flashcard) {
          flashcard.remove();
        }

        if (!container.querySelector('.flashcard')) {
          container.innerHTML = emptyStateHtml;
        }
      })
      .catch(function() {
        alert('Could not remove card. Please try again.');
      });
  });
});

