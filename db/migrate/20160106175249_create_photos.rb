class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.text :caption
      t.belongs_to :art

      t.timestamps null: false
    end
  end
end
