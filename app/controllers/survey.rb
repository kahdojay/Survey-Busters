get '/survey/new' do
  erb :'survey/create_survey'
end

get '/survey/:id' do |id|
  @survey = Survey.find(id)
  erb :'survey/take_survey', locals: {survey: @survey}
end
