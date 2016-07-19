class CreateMediaFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :media_files do |t|
      t.integer :presentation_id
      t.attachment :file

      t.timestamps
    end
  end
end
