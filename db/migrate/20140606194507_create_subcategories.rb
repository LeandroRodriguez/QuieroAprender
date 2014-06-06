class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.belongs_to :category
      t.timestamps
    end
  end
end
