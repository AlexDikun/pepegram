# frozen_string_literal: true

# top-level class documentation comment

class AddForeignKeyToFollows < ActiveRecord::Migration[6.0]
  def change
    # will only work if, during the first migration, comment it out, then uncomment it and start the migration again
    add_foreign_key :follows, [:follower_id, :following_id], unique: true
  end
end
