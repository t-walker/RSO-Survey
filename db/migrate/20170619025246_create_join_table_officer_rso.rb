class CreateJoinTableOfficerRso < ActiveRecord::Migration[5.0]
  def change
    create_join_table :officers, :rsos do |t|
      t.index [:officer_id, :rso_id]
      
    end
  end
end
