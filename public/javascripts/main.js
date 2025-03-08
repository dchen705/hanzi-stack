document.addEventListener('DOMContentLoaded', function() {
  const navbarToggler = document.querySelector('.navbar-toggler');
  const logoutLink = document.querySelector('a[href="/logout"]');
  const logoutForm = document.querySelector('form[action="/logout"]');
  const messageBox = document.querySelector('.alert');

  function fadeToggleMessage() {
    const messageBox = document.querySelector('.alert');
    const messageStyle = getComputedStyle(messageBox);
    const displayTime = Number(messageStyle.getPropertyValue('--display-time'));

    messageBox.style.transition = '';
    messageBox.style.opacity = '1';

    setTimeout(() => {
      messageBox.style.transition = 'opacity 2s ease-out';
      messageBox.style.opacity = '0';
    }, displayTime * 1000);
  };

  if (messageBox != null) {
    fadeToggleMessage();
  }

  navbarToggler.addEventListener('click', function(event) {
      event.preventDefault();
      event.stopPropagation();
    });

  logoutLink.addEventListener('click', function(event) {
    event.preventDefault();
    event.stopPropagation();

    logoutForm.submit();
  });
})