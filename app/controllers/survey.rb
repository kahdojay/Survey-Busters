get '/survey/:id' do |id|
  @survey = Survey.find(id)
  erb :'survey/take_survey', locals: {survey: @survey, stat_array: nil}
end


get '/survey/:id/stat' do |id|
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
