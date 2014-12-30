#create a new survey
get '/:id/survey/new' do |id|
  if session[:user_id] != id.to_i
    redirect('/')
  else
    erb :'survey/create_survey'
  end
end

post '/:id/survey/new' do |id|
  @new_survey = Survey.create(title: params['new_survey']['title'], user_id: id)
  erb :'survey/create_survey'
end



#routing to take survey page
# get '/survey/:id' do |id|
#   @survey = Survey.find(id)
#   erb :'survey/take_survey', locals: {survey: @survey}
# end
