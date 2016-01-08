class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :art, null: false
      t.string :name, null: false
      t.text :caption

      t.timestamps null: false
    end
  end
end
