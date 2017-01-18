class AddAdminIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :admin_id, :integer
  end
end
