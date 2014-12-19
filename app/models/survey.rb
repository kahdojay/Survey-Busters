class Survey < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user
  has_many :users, through: :survey_takers
  has_many :questions
end
