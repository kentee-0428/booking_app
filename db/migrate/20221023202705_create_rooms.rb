class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.integer :price
      t.string :address
      t.string :image
      t.string :introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
