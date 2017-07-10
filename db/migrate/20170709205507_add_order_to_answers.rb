class AddOrderToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :order, :integer
  end
end
