class RemoveAvatarFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :avatar, :string
    add_column :users, :avatar_id, :string
  end
end
