class RenameImageProperty < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :image, :image_url
  end
end
