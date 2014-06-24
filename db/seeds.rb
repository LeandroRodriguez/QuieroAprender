# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(:name => "Musica")
Category.create(:name => "Idioma")
Category.create(:name => "Baile")

Subcategory.create(:name => "Guitarra", :category_id => 1)
Subcategory.create(:name => "Piano", :category_id => 1)
Subcategory.create(:name => "Bateria", :category_id => 1)

Subcategory.create(:name => "Ingles", :category_id => 2)
Subcategory.create(:name => "Frances", :category_id => 2)
Subcategory.create(:name => "Aleman", :category_id => 2)
Subcategory.create(:name => "Italiano", :category_id => 2)


Subcategory.create(:name => "Salsa", :category_id => 3)
Subcategory.create(:name => "Tango", :category_id => 3)
Subcategory.create(:name => "Capoeira", :category_id => 3)

Tag.create(:name => "Musica")
Tag.create(:name => "Idioma")
Tag.create(:name => "Baile")