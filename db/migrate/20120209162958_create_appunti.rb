class CreateAppunti < ActiveRecord::Migration
  def change
    create_table :appunti do |t|
      t.integer :cliente_id
      t.string :destinatario
      t.text :note
      t.string :stato
      t.integer :user_id

      t.timestamps
    end
  end
end
