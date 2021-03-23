# frozen_string_literal: true

# top-level class documentation comment
class DeviseCreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
    end

    add_index :accounts, :email,                unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
