get '/' do
  erb :home
end

post '/entries/new' do
  new_entry = Entry.create(params[:entry])
  if new_entry.valid?
    new_entry.save
    Tag.make_tags(new_entry.id, params[:tags][:tag_names])
    redirect('/entries/all')
  else
    @error = "Please write something."
    erb :home
  end
end

get '/users/:id/entries' do |id|
  @user = User.find(id)
  erb :'user/user'
end

get '/entries/all' do
  @entries = Entry.all
  erb :'entry/entries'
end

get '/entries/all/:tag' do |tag|
  @tags = Tag.all
  @entries = Entry.get_by_tag(tag)
  erb :'entry/entries'
end

get '/entry/:id' do |id|
  @entry = Entry.find(id)
  erb :'entry/single', locals: {entry: @entry}
end

get '/entry/:id/edit' do |id|
  if session[:user_id] == current_user.id
    @entry = Entry.find(id)
    erb :'entry/edit'
  else
    redirect('/')
  end
end

put '/entry/edit/:id' do |id|
  @entry = Entry.find(id)
  @entry.update_with_tags(params)
  redirect("/entry/#{@entry.id}")
end

delete '/entry/:id' do |id|
  if session[:user_id] == current_user.id
    entry = Entry.find(id)
    entry.delete!
  end
  redirect('/entries/all')
end


