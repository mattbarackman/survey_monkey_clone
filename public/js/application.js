$(document).ready(function() {

  $('.add_question').on('click', function(e) {
    e.preventDefault();
    var template = $('#question_template').clone();

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

  $('.new_survey').on('click', '#save_survey', function(e) {
    e.preventDefault();

    $.ajax({

      url: '/surveys/new',
      method: 'POST',
      data: $(this).closest('.new_survey').serialize()
    }).done(function(response) {
      var survey_id = response;
      console.log(response);
      for (var i = 1; i <= $('.question_box').length; i++) {

        var form = $('.question_submit:nth-of-type(i)').closest('.question_form');

        $.ajax({
          url: '/surveys/' + survey_id + '/questions/new',
          method: 'POST',
          data: form.serialize()
        });
      }
    });
  });
});
