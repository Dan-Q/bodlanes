class AddPluginOptionsToContentBlocks < ActiveRecord::Migration[5.0]
  def change
    add_column :content_blocks, :plugin_options, :text, limit: 65535
  end
end
