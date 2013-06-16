$(document).ready(function() {

  $('.add_question').on('click', function(e) {
    e.preventDefault();
    var template = $('.question_html_templates #question_template').clone();

    $('.question_list').append(template);

    $('.question_list #question_template').show();
  });
  $('a#sign-out').on("click", function(e) {
    e.preventDefault();
    var request = $.ajax({
      url: $(this).attr('href'),
      type: 'delete'
    });
    request.done(function() {
      window.location = "/";
    });
  });
  $('.question_list').on('click', '#add_resp', function(e) {
    e.preventDefault();
    addBox = $('#response_template').clone();
    console.log(addBox)
    $(this).parent().children().append(addBox);
  });
});
