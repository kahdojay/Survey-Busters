get '/:id/survey/new' do |id|
  if session[:user_id] != id.to_i
    redirect('/')
  else
    erb :'survey/create_survey'
  end
end

get '/survey/:id' do |id|
  @survey = Survey.find(id)
  erb :'survey/take_survey', locals: {survey: @survey}
end
