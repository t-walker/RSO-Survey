class CreateJoinTableKeywordRso < ActiveRecord::Migration[5.0]
  def change
    create_join_table :keywords, :rsos do |t|
      t.index [:keyword_id, :rso_id]
      # t.index [:rso_id, :keyword_id]
    end
  end
end
