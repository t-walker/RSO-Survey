class ChangeColumnNameForQuestionTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :question, :question_title
  end
end
