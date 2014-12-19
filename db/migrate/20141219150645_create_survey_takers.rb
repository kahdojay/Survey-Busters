class CreateSurveyTakers < ActiveRecord::Migration
  def change
    create_table :survey_takers do |t|
      t.references :user
      t.references :survey
      t.timestamps
    end
  end
end
