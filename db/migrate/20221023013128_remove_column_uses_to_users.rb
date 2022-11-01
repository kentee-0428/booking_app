class RemoveColumnUsesToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :uses, :string
  end
end
