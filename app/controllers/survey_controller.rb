get '/surveys' do
	erb :surveys
end

get '/surveys/new' do
	erb :create_survey_form
end

post '/surveys/new' do

  p params
  creator = current_user

  survey = Survey.new(name: params[:title], user_id: creator.id)

  questions = ParseQuestionData(params[:questions])

  questions.each do |question|
    survey.questions << question
  end
  creator.surveys << survey
  creator.save

  survey.id.to_s
end


get '/surveys/:id' do |id|
	@survey = Survey.find(id)
	erb :survey
end

post '/surveys/:id' do 
 	params[:questions].each_pair do |k,v|
 	choice= v.to_i
 	question=k.to_i

 	# user = User.find(session[:user_id])
	# 	
	Response.create(:user_id => 1, :choice_id => choice, :question_id => question)
	end
end

	# user = User.find(session[:user_id])
	# p user

delete '/survey/:id' do |id|
  # delete survey
end

get '/surveys/:id/results' do
	p params
  if authorized_for_results(params[:id])
  	survey_result_objects
	  erb :results
	else
		erb :sign_in
	end
end

post '/surveys/:id/questions/new' do |id|

end
