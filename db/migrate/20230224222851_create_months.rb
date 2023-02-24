# frozen_string_literal: true

class CreateMonths < ActiveRecord::Migration[7.0]
  def change
    create_table :months do |t|
      t.string :name
      t.references :year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
