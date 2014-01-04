class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :street, null:false
      t.string :city, null:false
      t.string :state, null:false
      t.string :postal_code, null:false
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
