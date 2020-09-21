# frozen_string_literal: true

# top-level class documentation comment
class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :message

      t.timestamps
    end
  end
end
