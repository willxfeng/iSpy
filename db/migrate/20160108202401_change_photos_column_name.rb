class ChangePhotosColumnName < ActiveRecord::Migration
  def change
    rename_column :photos, :name, :art_photo
  end
end
