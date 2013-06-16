get '/surveys' do
  erb :surveys
end

get '/surveys/new' do
  erb :create_survey_form
end

post '/surveys/new' do

  creator = current_user

  survey = Survey.new(name: params[:title], user_id: creator.id)

  questions = ParseQuestionData(params[:questions])

  questions.each do |question|
    survey.questions << question
  end
  creator.surveys << survey
  creator.save
end


#   question = Question.create(survey_id: id, text: params[:question])
#   choices_text = params[:responses]
#   p choices_text
#   choices_text.each do |choice|
#     p choice
#     question.choices << Choice.create(text: choice)
#   end
# end

get '/surveys/:id' do |id|
  erb :survey
end

put '/surveys/:id' do |id|
  # save survey response
end

delete '/survey/:id' do |id|
  # delete survey
end

get '/surveys/:id/results' do |id|
  #show survey results. duh.
end

post '/surveys/:id/questions/new' do |id|

end
