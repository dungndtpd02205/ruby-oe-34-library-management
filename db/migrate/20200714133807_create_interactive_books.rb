class CreateInteractiveBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :interactive_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :action

      t.timestamps
    end
  end
end
