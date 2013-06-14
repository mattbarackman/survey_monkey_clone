
get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])

  if user.authenticate(params[:password])
    p "set user id in session"
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil
end
