# frozen_string_literal: true

class AddDeletedAtToTokens < ActiveRecord::Migration[5.2]
  def change
    add_column :tokens, :deleted_at, :datetime
    add_index :tokens, :deleted_at
  end
end
