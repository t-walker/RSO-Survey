class CreateOfficerRsos < ActiveRecord::Migration[5.0]
  def change
    create_table :officer_rsos do |t|
      t.belongs_to :officer, :null => false, :index => true, foreign_key: true
      t.belongs_to :rso, :null => false, :index => true, foreign_key: true
    end
  end
end
