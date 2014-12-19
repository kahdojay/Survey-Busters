class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :survey
  validates_presence_of :description
end
