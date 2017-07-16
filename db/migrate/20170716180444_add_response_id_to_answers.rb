class AddResponseIdToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :response_id, :integer
  end
end
