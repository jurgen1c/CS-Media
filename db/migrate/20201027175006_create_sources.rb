class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.references :article, index: true, foreign_key: true
      t.references :review, index: true
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
