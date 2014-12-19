class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :tag_name
    end
  end
end
