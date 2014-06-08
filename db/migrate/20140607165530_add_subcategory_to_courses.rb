class AddSubcategoryToCourses < ActiveRecord::Migration
  def change
  	add_reference :courses, :subcategory, index: true
  end
end
