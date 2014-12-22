class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :survey
  validates_presence_of :description


  def find_stat
    answer_stat_hash = {}
    answers_to_the_question = Answer.where(question_id: self.id)
    answers_to_the_question.each do |answer|
      answer_stat_hash[answer.description] = Selection.where(answer_id: answer.id).count
    end
    total_response_count = answer_stat_hash.values.sum
    answer_stat_hash.each do |des, count|
      answer_stat_hash[des] = (count/total_response_count) * 100
    end
    answer_stat_hash
  end

end
