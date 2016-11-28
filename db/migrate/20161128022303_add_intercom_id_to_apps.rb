class AddIntercomIdToApps < ActiveRecord::Migration
  def change
    add_column :apps, :intercom_id, :string
  end
end
