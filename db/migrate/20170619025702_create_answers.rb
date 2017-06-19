class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.string :icon

      t.timestamps
    end
  end
end
