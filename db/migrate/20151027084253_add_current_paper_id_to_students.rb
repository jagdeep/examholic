class AddCurrentPaperIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :current_paper_id, :integer
    add_index :students, :current_paper_id
  end
end
