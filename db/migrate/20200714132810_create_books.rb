class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.references :categories, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.date :publish_day
      t.integer :quantity
      t.integer :num_of_pages

      t.timestamps
    end
  end
end
