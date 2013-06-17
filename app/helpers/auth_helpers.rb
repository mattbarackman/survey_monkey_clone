

helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_for_results(id)
  	if current_user
  		@survey = User.find(session[:user_id]).surveys.find(id)
  	end
  end

  def ParseQuestionData(question_data)
  
    questions = []
    question_data.each do |question|

      p text = question[1][:question_text]

      new_question = Question.create(text: text)

      p choices = question[1][:choices]

      choices.each do |choice|
        new_question.choices << Choice.create(text: choice)
      end

      questions << new_question
    end
    
  questions
  end

end
