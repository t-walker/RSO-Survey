class MakeQuestionOrderUnique < ActiveRecord::Migration[5.0]
  def up
    change_column :questions, :order, :integer, unique: true
  end
  def down
    change_column :questions, :order, :integer, unique: false
  end
end
