class AddDefaultZoomToScreenType < ActiveRecord::Migration[5.0]
  def change
    add_column :screen_types, :default_zoom, :string, default: "1"
  end
end
