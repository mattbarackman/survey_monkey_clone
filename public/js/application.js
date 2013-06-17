
$(document).ready(function() {

  $('.add_question').on('click', function(e) {
    e.preventDefault();
    var template = $('.question_hidden_template').clone();
    template.addClass('question_template');
    template.removeClass('question_hidden_template');
    $('.question_list').append(template);
    // $('.question_template').show();
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

      var survey_data = {};
      var questions = [];

      survey_data["title"] = $('.new_survey').find('input[name="form[name]"]')[0].value;

      for (var i = 1; i <= $('.question_list .question_form').length; i++) {

        var question_form = $('.question_template:nth-of-type(' + i + ') .question_form');
        var question_data = {};
        var inputted_data = question_form.find('input[type="text"]');

        question_data["question_text"] = inputted_data[0].value;
        question_data["choices"] = [];

        for (var j in inputted_data) {
          if (j > 0) {
            question_data["choices"].push(inputted_data[j].value);
          }
        }
        questions.push(question_data);
      }

      survey_data["questions"] = questions;

      $.ajax({

        url: '/surveys/new',
        method: 'POST',
        dataType: 'json',
        data: survey_data
      });

  });
  $('.question_list').on('click', '#add_resp', function(e) {
    e.preventDefault();
    addBox = $('.response_hidden_template').clone();
    addBox.addClass('response_template');
    addBox.removeClass('response_hidden_template');
    $(this).parent().children('#response_box').append(addBox);
  });
});
