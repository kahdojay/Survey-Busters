get '/surveys' do
  @surveys = Survey.all
  erb :'survey/all'
end

get '/survey/:id' do |id|
  @survey = Survey.find(id)
  erb :'survey/take_survey', locals: {survey: @survey, stat_array: nil}
end


get '/survey/:id/submit' do |id|
  params.each do |key, answer_id|
    next if !(key.match("response"))
    s = Selection.create(answer_id: answer_id.to_i)
    s.user_id = current_user.id if current_user
    p s
  end

  @survey = Survey.find(id)
  stat_array = @survey.questions.map {|q| q.find_stat}
  erb :'survey/take_survey', locals: {survey: @survey, stat_array: stat_array, questions: @survey.questions}, layout: false
end

post '/surveys/new' do
  new_survey = Survey.create(params[:survey])
  if new_survey.valid?
    new_survey.save
    redirect('/surveys')
  else
    @error = "Please write something."
    erb :main
  end
end

get '/survey/:id/edit' do |id|
  if session[:user_id] == current_user.id
    @survey = Survey.find(id)
    erb :'survey/edit'
  else
    redirect('/')
  end
end

put '/survey/:id/edit' do |id|
  @survey = Survey.find(id)
  redirect("/survey/#{@survey.id}")
end

delete '/survey/:id' do |id|
  if session[:user_id] == current_user.id
    survey = Survey.find(id)
    survey.delete!
  end
  redirect('/surveys')
end