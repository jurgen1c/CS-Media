class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :type, index: true
      t.string :title
      t.timestamps
    end
  end
end
