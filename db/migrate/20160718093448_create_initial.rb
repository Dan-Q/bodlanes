class CreateInitial < ActiveRecord::Migration[5.0]
  def change
    create_table :screen_types do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.timestamps
    end

    create_table :templates do |t|
      t.integer :screen_type_id
      t.string :name
      t.string :code
      t.timestamps
    end

    create_table :content_areas do |t|
      t.integer :template_id
      t.string :name
      t.integer :width
      t.integer :height
      t.string :content_type
      t.timestamps
    end

    create_table :content_blocks do |t|
      t.integer :content_area_id
      t.integer :presentation_id
      t.string :name
      t.string :content_type
      t.text :content
      t.boolean :default
      t.timestamps
    end

    create_table :presentations do |t|
      t.string :name
      t.integer :template_id
      t.timestamps
    end
  end
end
