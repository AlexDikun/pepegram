# frozen_string_literal: true

# add a column to the posts table for storing images
class AddImageDataToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image_data, :text
  end
end
