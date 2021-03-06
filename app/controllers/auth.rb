get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id

    redirect '/'

  else
    set_error('Login Failed.')
    redirect '/login'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  new_user = User.new(params[:user])

  if new_user.valid? && params[:user][:password] == params[:password_confirm]
    new_user.save
    session[:user_id] = new_user.id
    redirect '/'
  else
    set_error('signup failed.')
    redirect 'signup'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
