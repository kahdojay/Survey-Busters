class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :user
      t.references :answer
      t.timestamps
    end
  end
end
