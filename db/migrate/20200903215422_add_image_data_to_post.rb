# frozen_string_literal: true

# top-level class documentation comment
class AddImageDataToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image_data, :text
  end
end
