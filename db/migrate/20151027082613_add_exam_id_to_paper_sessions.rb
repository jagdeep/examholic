class AddExamIdToPaperSessions < ActiveRecord::Migration
  def change
    add_column :paper_sessions, :exam_id, :integer
    add_index :paper_sessions, :exam_id
  end
end
