class CreateCustomDataAttributes < ActiveRecord::Migration
  def change
    create_table :custom_data_attributes do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.string :data_type, null: false
      t.timestamps
    end
  end
end
