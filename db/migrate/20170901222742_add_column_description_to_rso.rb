class AddColumnDescriptionToRso < ActiveRecord::Migration[5.0]
  def change
    add_column :rsos, :description, :string
    add_column :rsos, :website, :string
  end
end
