class CreateArt < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :description, null: false
      t.string :category, null: false
      t.string :artist
      t.integer :average_rating
    end
  end
end
