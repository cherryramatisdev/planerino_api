class CreateDebits < ActiveRecord::Migration[7.0]
  def change
    create_table :debits do |t|
      t.string :title
      t.float :price
      t.boolean :paid, default: false
      t.references :payer, null: false, foreign_key: true
      t.references :month, null: false, foreign_key: true

      t.timestamps
    end
  end
end
