class CreateRsoKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :rso_keywords do |t|
      t.belongs_to :rso, :index => true, foreign_key: true
      t.belongs_to :keyword, :index => true, foreign_key: true
    end
  end
end
