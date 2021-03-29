# frozen_string_literal: true

# top-level class documentation comment
class AddForeignKeyToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :accounts
    add_foreign_key :comments, :posts
  end
end
