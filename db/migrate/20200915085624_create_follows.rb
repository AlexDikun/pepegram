class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :following_id
    end

    add_foreign_key :follows, :accounts, column: :follower_id
    add_foreign_key :follows, :accounts, column: :following_id
  end
end