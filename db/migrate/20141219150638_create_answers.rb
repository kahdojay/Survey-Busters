class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.references :question
      t.timestamps
    end
  end
end
