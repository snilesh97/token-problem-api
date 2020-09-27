# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :value, index: { unique: true }, null: false
      t.integer :status, null: false, default: 0
      t.datetime :available_at, null: false

      t.timestamps
    end
  end
end
