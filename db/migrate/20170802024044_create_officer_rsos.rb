class CreateOfficerRsos < ActiveRecord::Migration[5.0]
  def change
    create_table :officer_rsos do |t|
      t.belongs_to :officer, :index => true, foreign_key: true
      t.belongs_to :rso, :index => true, foreign_key: true
    end
  end
end
