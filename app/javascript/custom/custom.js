document.addEventListener('DOMContentLoaded', function() {
  var alertContainer = document.getElementById('alert-container');
  if (alertContainer) {
    setTimeout(function() {
      alertContainer.style.display = 'none';
    }, 3000);
  }
});
