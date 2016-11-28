class AddAppIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :app_id, :integer
  end
end
