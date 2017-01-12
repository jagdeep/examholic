class AddNoOfQuestionsToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :no_of_questions, :integer
  end
end
