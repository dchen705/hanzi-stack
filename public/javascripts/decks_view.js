document.addEventListener('DOMContentLoaded', function() {
  const addDeckButton = document.querySelector('button.deck-add');
  const dialog = document.querySelector('dialog');
  const cancelButton = document.querySelector('button.deck-add-cancel');
  const loggedIn = document.querySelector('button.logout') != null;

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
});


