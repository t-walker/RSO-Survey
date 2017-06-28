class CreateRsos < ActiveRecord::Migration[5.0]
  def change
    create_table :rsos do |t|
      t.string :name
      t.string :nickname

      t.timestamps
    end
  end
end
