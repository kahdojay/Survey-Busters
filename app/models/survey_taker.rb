class SurveyTaker < ActiveRecord::Base
  belongs_to :taker, foreign_key: :user_id, class_name:"User"
  belongs_to :survey
end
