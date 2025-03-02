document.addEventListener('DOMContentLoaded', function() {

  // Add Buttons
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

  // Remove Buttons
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