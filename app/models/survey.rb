class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :survey_takers
  has_many :questions
end
