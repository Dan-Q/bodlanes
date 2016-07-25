class AddTimingsToContentBlocks < ActiveRecord::Migration[5.0]
  def change
    add_column :content_blocks, :timings, :text
  end
end
