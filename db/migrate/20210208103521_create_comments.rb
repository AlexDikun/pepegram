# frozen_string_literal: true

# top-level class documentation comment
class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :account_id
      t.integer :post_id

      t.timestamps
    end
  end
end
