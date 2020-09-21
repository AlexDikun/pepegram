# frozen_string_literal: true

# top-level class documentation comment
class AddUsernameToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :username, :string
  end
end
