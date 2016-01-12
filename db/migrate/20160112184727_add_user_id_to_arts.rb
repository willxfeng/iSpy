class AddUserIdToArts < ActiveRecord::Migration
  def change
    change_table(:arts) do |t|
      t.belongs_to :user, null: false
    end
  end
end
