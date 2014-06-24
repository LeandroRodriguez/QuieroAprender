class CreateAdvertising < ActiveRecord::Migration
  def change
    create_table :advertisings do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :price

      t.timestamps	
    end
  end
end
