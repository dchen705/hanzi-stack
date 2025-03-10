document.addEventListener('DOMContentLoaded', function() {
  const removeLink = document.querySelector('.deck-remove-link');
  const renameLink = document.querySelector('.deck-rename-link');
  const renameDialog = document.querySelector('dialog.rename-deck');
  const renameCancel = document.querySelector('button.rename-deck-cancel');

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
  })

  renameLink.addEventListener('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    renameDialog.showModal();
  });

  renameCancel.addEventListener('click', function() {
    renameDialog.close();
  });
});