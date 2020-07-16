  class CreateRequestBorrowBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :request_borrow_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
