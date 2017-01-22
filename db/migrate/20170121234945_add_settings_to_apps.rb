class AddSettingsToApps < ActiveRecord::Migration
  def change
    add_column :apps, :user_id_enabled, :boolean, :default => true
    add_column :apps, :secure_mode_enabled, :boolean, :default => false
  end
end
