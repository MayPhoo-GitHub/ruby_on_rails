class ChangeUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :users_id, :user_id
  end
end
