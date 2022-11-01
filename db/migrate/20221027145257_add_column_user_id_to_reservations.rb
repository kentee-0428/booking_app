class AddColumnUserIdToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :user_id, :integer
  end
end
