class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
      t.boolean :up_vote
      t.boolean :down_vote
      t.timestamps
    end
  end
end
