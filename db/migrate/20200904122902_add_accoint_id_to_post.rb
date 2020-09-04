class AddAccointIdToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :post, :account_id, :integer
    add_foreign_key :posts, :accounts
  end
end
