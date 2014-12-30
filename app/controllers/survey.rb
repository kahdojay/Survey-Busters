# get '/:id/survey/:survey_id' do
#   @survey = Survey.find(params[:survey_id])
#   erb :'survey/show'
# end

#create a new survey
get '/:id/survey/new' do |id|
  if session[:user_id] != id.to_i
    redirect('/')
  else
    erb :'survey/create_survey'
  end
end


#Instantiates new survey after clicking add title, and redirects to edit
post '/:id/survey/new' do |id|
  @new_survey = Survey.create(title: params['new_survey']['title'], user_id: id)
  redirect("#{id}/survey/#{@new_survey.id}/edit")
end


get '/:id/survey/:survey_id/edit' do |id, survey_id|
  @survey = Survey.find(survey_id)
  erb :'survey/edit'
end




#routing to take survey page
# get '/survey/:id' do |id|
#   @survey = Survey.find(id)
#   erb :'survey/take_survey', locals: {survey: @survey}
# end
