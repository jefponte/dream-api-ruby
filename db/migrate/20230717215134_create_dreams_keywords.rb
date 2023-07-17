class CreateDreamsKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :dreams_keywords, id: false do |t|
      t.references :dream, null: false, foreign_key: true
      t.references :keyword, null: false, foreign_key: true

      t.index [:dream_id, :keyword_id], unique: true
    end
  end
end