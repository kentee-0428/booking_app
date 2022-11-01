class AddUsesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uses, :string
  end
end
