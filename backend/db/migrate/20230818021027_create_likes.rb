class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.datetime :date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :likeable, polymorphic: true, null: false

      t.timestamps
    end

    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
  end
end
