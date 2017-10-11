class RemovePositionIndexFromQuestionTable < ActiveRecord::Migration[5.0]
  def change
    remove_index(:questions, :name => 'index_questions_on_position')
  end
end
