class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :owner, index: true
      t.references :building, index: true

      t.timestamps
    end
  end
end
