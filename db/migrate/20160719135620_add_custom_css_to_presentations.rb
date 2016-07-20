class AddCustomCssToPresentations < ActiveRecord::Migration[5.0]
  def change
    add_column :presentations, :custom_css, :text
  end
end
