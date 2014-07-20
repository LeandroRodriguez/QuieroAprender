#encoding: utf-8
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

Teacher.create(name: 'Juan Perez', description: 'Profesor de guitarra. 12 anios de experiencia')
Teacher.create(name: 'Ernerto Gomez', description: 'Profesor de ingles. 5 anios viviendo en Inglaterra. Certificaciones internacionales')

Course.create(name: "Guitarra para principiantes", description: "Curso de guitarra en zona sur", longitude: -58.3887, latitude: -34.8029, address: "Avenida Tomás Espora 1007, Adrogué, Buenos Aires Province, Argentina", subcategory_id: 1, price: 150)
Course.create(name: "Curso de Piano clásico", description: "Curso de piano, nivel avanzado", longitude: -58.38872439999999, latitude: -34.8103353, address: "Avenida Tomás Espora 1507, Adrogué, Buenos Aires Province, Argentina", subcategory_id: 2, price: 350)
Course.create(name: "Aprenda ingles con Miss Carla", description: "Clases de ingles para escolares", longitude: -58.3792534, latitude: -34.7678337, address: "Temperley, Buenos Aires Province, Argentina", subcategory_id: 4, price: 200)

Opinion.create(description: "100% recomendado! El profe un genio!", course_id: 1, date: Time.now - 2, rating: 5)
Opinion.create(description: "El profesor sabe mucho pero no explica bien", course_id: 1, date: Time.now - 1, rating: 1)