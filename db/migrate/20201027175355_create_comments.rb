class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true
      t.text :content
      t.timestamps
    end
  end
end
