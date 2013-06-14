
get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.new(params[:user])
  if user.valid?
    user.save
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/users/new'
  end
end



