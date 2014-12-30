
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


get '/survey/:id' do |id|
  @survey = Survey.find(id)
  erb :'survey/take_survey', locals: {survey: @survey, stat_array: nil}
end


get '/survey/:id/submit' do |id|
  # create selection record
  params.each do |key, answer_id|
    next if !(key.match("response"))
    s = Selection.create(answer_id: answer_id.to_i)
    s.user_id = current_user.id if current_user
    p s
  end

  # create survey_taker record
  SurveyTaker.create(survey_id: id, user_id: current_user.id)

  # get stats
  @survey = Survey.find(id)
  stat_array = @survey.questions.map {|q| q.find_stat}
  erb :'survey/take_survey', locals: {survey: @survey, stat_array: stat_array, questions: @survey.questions}, layout: false
end

