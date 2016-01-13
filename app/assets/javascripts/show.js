$(document).ready(function() {
  $('.votes').click(function(event) {
    event.preventDefault();
    button = this;
    console.log(button);
    var request = $.ajax({
      method: "POST",
      url: '/reviews/' + button.id + '/votes'
    });
  });
});
