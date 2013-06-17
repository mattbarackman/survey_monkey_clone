get '/surveys' do
  erb :surveys
end

get '/surveys/new' do
  erb :create_survey_form
end

post '/surveys/new' do
  # save survey to DB
  # redirect to survey url
end

get '/surveys/:id' do |id|
  erb :survey
end

put '/surveys/:id' do |id|
  # save survey response
end

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
