document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.list-add').forEach(function(button) {
    button.addEventListener('click', function() {
      var characterId = this.getAttribute('data-character-id');
      fetch('/stack', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'id=' + characterId
      }).then (response => {
        button.textContent = '✅ Saved';
        button.disabled = true;
        var removeButton = document.querySelector(`.list-remove[data-character-id='${characterId}'`)
        removeButton.classList.remove('hidden');
        removeButton.disabled = false;
      });
    })
  })

  document.querySelectorAll('.list-remove').forEach(function(button) {
    button.addEventListener('click', function() {
      var characterId = this.getAttribute('data-character-id')
      fetch('/stack/remove', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'id=' + characterId
      }).then(response => {
        var saveButton = document.querySelector(`.list-add[data-character-id='${characterId}']`)
        saveButton.textContent = '➕ Add to Stack'
        saveButton.disabled = false
        this.classList.add('hidden')
        this.disabled = true
      });
    });
  });
});