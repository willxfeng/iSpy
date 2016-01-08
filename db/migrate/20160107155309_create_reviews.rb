class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :rating, null: false
      t.integer :likes
      t.integer :dislikes
      t.belongs_to :art, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
