

helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_for_results(id)
  	if current_user
  		@survey = User.find(session[:user_id]).surveys.find(id)
  	end
  end
end
