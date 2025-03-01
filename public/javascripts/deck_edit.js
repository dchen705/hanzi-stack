document.addEventListener('DOMContentLoaded', function() {
  const removeButton = document.querySelector('.deck-remove button');

  removeButton.addEventListener('click', function(event) {
    event.preventDefault();

    const userConfirmed = confirm('Are you sure you want to delete this deck?');

    if (userConfirmed) {
      const confirmInput = document.createElement('input');
      confirmInput.type = 'hidden';
      confirmInput.name = 'confirm';
      confirmInput.value = 'true';

      const form = removeButton.closest('form');

      form.appendChild(confirmInput);

      form.submit();
    }
  })
});