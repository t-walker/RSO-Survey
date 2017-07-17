class ChangeOrderColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :order, :position
    rename_column :answers, :order, :position
  end
end
