class RenameUserIdToOwnerIdOnRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :user_id, :owner_id
  end
end
