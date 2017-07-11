class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.integer :weight
      t.integer :answer_id
      t.timestamps
    end
  end
end
