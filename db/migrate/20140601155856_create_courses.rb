class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude
      t.string :address

      t.timestamps
    end
  end
end
