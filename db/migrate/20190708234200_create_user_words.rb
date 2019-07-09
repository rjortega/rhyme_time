class CreateUserWords < ActiveRecord::Migration[5.2]
  def change
    create_table :user_words do |t|
      t.references :word, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
