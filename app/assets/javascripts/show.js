$(document).ready(function() {
  $('.votes').click(function(event) {
    event.preventDefault();

    var newVote = this.id.split('-')[0];
    var rId = this.id.split('-')[1];

    var request = $.ajax({
      method: 'POST',
      url: '/reviews/' + rId + '/votes',
      data: { newVote: newVote, rId: rId }
    });

    request.done(function(response) {
      var upvoteText = 'Upvote';
      var downvoteText = 'Downvote';

      if (response.upvotes != 1)
        upvoteText = 'Upvotes';
      if (response.downvotes != 1)
        downvoteText = 'Downvotes';

      $('#upvote-' + rId)
        .attr('value', response.upvotes + ' ' + upvoteText);
      $('#downvote-' + rId)
        .attr('value', response.downvotes + ' ' + downvoteText);
    });
  });
});
