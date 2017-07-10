class MakeQuestionOrderUnique < ActiveRecord::Migration[5.0]
  def change
    add_index :questions, :order, unique: true
  end
end
