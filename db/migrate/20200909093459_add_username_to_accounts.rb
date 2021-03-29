# frozen_string_literal: true

# add the username column to the accounts table
class AddUsernameToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :username, :string
  end
end
