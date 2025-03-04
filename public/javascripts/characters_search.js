document.addEventListener('DOMContentLoaded', function() {
// EVENT LISTENERS
  // Add to Stack Buttons
  document.querySelectorAll('.stack-add').forEach(function(button) {
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
        var removeButton = document.querySelector(`.stack-remove[data-character-id='${characterId}'`)
        removeButton.classList.remove('hidden');
        removeButton.disabled = false;
      });
    })
  })

  // Remove from Stack Buttons
  document.querySelectorAll('.stack-remove').forEach(function(button) {
    button.addEventListener('click', function() {
      var characterId = this.getAttribute('data-character-id')
      fetch('/stack/remove', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'id=' + characterId
      }).then(response => {
        var saveButton = document.querySelector(`.stack-add[data-character-id='${characterId}']`);
        saveButton.textContent = '➕ Add to Stack';
        saveButton.disabled = false;
        this.classList.add('hidden');
        this.disabled = true;
      });
    });
  });

  // Add to Deck Buttons
    document.querySelectorAll('.deck-add').forEach(function(button) {
      button.addEventListener('click', function() {
        var characterId = this.getAttribute('data-character-id');
        var deckId = document.querySelector('.edit-link').getAttribute('data-deck-id');

        fetch('/deck/edit/add', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: 'character-id=' + characterId + '&' + 'deck-id=' + deckId
        }).then(response => {
          var removeButton = document.querySelector(`.deck-remove[data-character-id='${characterId}']`);
          removeButton.classList.remove('hidden');
          removeButton.disabled = false;
          button.textContent = '✅ In Deck';
          button.disabled = true;
        });
      });
    });

  // Remove from Deck buttons
  document.querySelectorAll('.deck-remove').forEach(function(button) {
    button.addEventListener('click', function() {
      var characterId = button.getAttribute('data-character-id');
      var deckId = document.querySelector('.edit-link').getAttribute('data-deck-id');

      fetch('/deck/edit/remove', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'character-id=' + characterId + '&' + 'deck-id=' + deckId
      }).then(response => {
        var addButton = document.querySelector(`.deck-add[data-character-id='${characterId}']`);
        addButton.textContent = '➕ Add to Deck';
        addButton.disabled = false;
        button.classList.add('hidden');
        button.disabled = true;
      });
    });
  })

  // Select
  const currentOption = document.querySelector("select ~ input[name='deck-name']").value;
  const selectDeckId = document.querySelector("select ~ input[name='deck-id']");
  const selectDeckName = document.querySelector("select ~ input[name='deck-name']");
  document.querySelectorAll('option').forEach(function(option) {
    var optionDeckId = option.getAttribute('data-deck-id');
    var optionDeckName = option.getAttribute('data-deck-name');
    if (option.textContent == currentOption) {
      option.selected = true;
      selectDeckId.value = optionDeckId;
      selectDeckName.value = optionDeckName;
    };
    option.addEventListener('click', function() {
      selectDeckId.value = optionDeckId;
      selectDeckName.value = optionDeckName;
    });
  });
});