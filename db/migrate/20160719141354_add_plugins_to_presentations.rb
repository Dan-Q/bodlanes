class AddPluginsToPresentations < ActiveRecord::Migration[5.0]
  def change
    add_column :presentations, :plugins, :text
  end
end
