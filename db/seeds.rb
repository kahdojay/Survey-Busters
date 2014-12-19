require 'faker'

# seed users
10.times do
  User.create(
    email: Faker::Internet.email,
    password: 'a'
    )
end

# seed survey takers

100.times do
  SurveyTaker.create(survey_id: rand(1..10), user_id: rand(1..10))
end

# seed selections
100.times do
  Selection.create(user_id: rand(1..10), answer_id: rand(1..50))
end

# seed surveys

10.times do
  Survey.create(
    title: Faker::Lorem.sentence,
    user_id: rand(1..10)
    )
end

# seed questions
surveys = Survey.all
surveys.each do |survey|
  5.times do
    survey.questions << Question.create(description: Faker::Lorem.sentence)
  end
end

# seed answers
questions = Question.all
questions.each do |question|
    4.times do
      question.answers << Answer.create(description: Faker::Lorem.word)
    end
end