class User < ActiveRecord::Base
  has_secure_password
  # validates :email, presence: true, email: true
  has_many :created_surveys, class_name: "Survey"

  has_many :taken_surveys, through: :survey_takers, source: :survey
  has_many :survey_takers

  has_many :selections
  has_many :answers, through: :selections

  validates_uniqueness_of :email
  validates_presence_of :email, :password
end
