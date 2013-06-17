get '/' do
  # Look in app/views/index.erb
  @surveys = User.find(current_user).surveys if current_user
  erb :index
end
