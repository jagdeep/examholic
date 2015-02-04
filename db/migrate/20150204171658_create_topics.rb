class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :subject_id

      t.timestamps null: false
    end
  end
end
