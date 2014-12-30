get '/users/:id' do |id|
  @user = User.find(id)
  erb :'user/home'
end