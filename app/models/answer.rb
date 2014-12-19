class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :selections
  has_many :users, through: :selections
end
