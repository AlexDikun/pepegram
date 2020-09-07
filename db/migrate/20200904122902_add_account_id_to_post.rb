class AddAccountIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :account_id, :integer
    add_foreign_key :posts, :accounts
  end
end
