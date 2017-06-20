class CreateRsos < ActiveRecord::Migration[5.0]
  def change
    create_table :rsos do |t|
      t.string :name
      t.string :shortName
      t.string :category

      t.timestamps
    end
  end
end
