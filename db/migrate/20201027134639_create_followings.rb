class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|

      t.references :user, index: true, foreign_key: true
      t.references :follow, index: true
      t.timestamps null: false
    end
    add_foreign_key :followings, :users, column: :follow_id
    add_index(:followings, [:user_id, :follow_id], unique: true)
  end
end
