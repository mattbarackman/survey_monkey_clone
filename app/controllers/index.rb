get '/' do
  # Look in app/views/index.erb
  p session[:user_id]
  erb :index
end
