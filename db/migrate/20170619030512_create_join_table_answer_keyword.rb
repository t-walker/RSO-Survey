class CreateJoinTableAnswerKeyword < ActiveRecord::Migration[5.0]
  def change
    create_join_table :answers, :keywords do |t|
      t.index [:answer_id, :keyword_id]
      # t.index [:keyword_id, :answer_id]
    end
  end
end
