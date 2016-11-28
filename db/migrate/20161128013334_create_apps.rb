class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :subdomain

      t.timestamps null: false
    end
  end
end
