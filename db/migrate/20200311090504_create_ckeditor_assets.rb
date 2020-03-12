class CreateCkeditorAssets < ActiveRecord::Migration[5.1]
  def up
    create_table :ckeditor_assets do |t|
      t.string  :data_file_name, null: false
      t.string  :data_content_type
      t.integer :data_file_size
      t.string  :type, limit: 30

      t.timestamps null: false
    end

    add_index :ckeditor_assets, :type
  end

  def down
    drop_table :ckeditor_assets
  end
end
