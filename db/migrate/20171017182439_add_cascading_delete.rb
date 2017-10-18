class AddCascadingDelete < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :rso_keywords, :keywords
    remove_foreign_key :rso_keywords, :rsos
    add_foreign_key :rso_keywords, :keywords, on_delete: :cascade
    add_foreign_key :rso_keywords, :rsos, on_delete: :cascade
  end
end
