class CreateMediumEditorInsertPluginImages < ActiveRecord::Migration
  def change
    create_table :medium_editor_insert_plugin_images do |t|
      t.text :file
      t.timestamps
    end
  end
end
