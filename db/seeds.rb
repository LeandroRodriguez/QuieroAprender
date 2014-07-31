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

Plan.create(:name => "Visitas Básico", :type => "VisitsPlan", :price => 100.00, :active => true)
Plan.create(:name => "Visitas Full", :type => "VisitsPlan", :price => 300.00, :active => true)
Plan.create(:name => "Visitas Premium", :type => "VisitsPlan", :price => 1000.00, :active => true)
Plan.create(:name => "Inscripciones Básico", :type => "RegistrationsPlan", :price => 100.00, :active => true)
Plan.create(:name => "Inscripciones Full", :type => "RegistrationsPlan", :price => 300.00, :active => true)
Plan.create(:name => "Inscripciones Premium", :type => "RegistrationsPlan", :price => 1000.00, :active => true)

Teacher.create(name: 'Juan Perez', description: 'Profesor de guitarra. 12 años de experiencia')
Teacher.create(name: 'Ernerto Gomez', description: 'Profesor de ingles. 5 años viviendo en Inglaterra. Certificaciones internacionales')

User.create(:name => "Juan Perez", :description => "Profesor de guitarra. 12 años de experiencia", :image => "http://www.premierguitar.com/ext/resources/archives/81e5505d-a4b1-43f5-b7c0-69f7680c25cd.JPG?1371672480", :birthdate => "1966-07-08 00:00:00", :email => "juanperez@gmail.com", :role => User::ROLE_TEACHER, :password => "123123", :password_confirmation => "123123")
User.create(:name => "Carla Gomez", :description => "Profesora de ingles. 5 años viviendo en Inglaterra. Certificaciones internacionales", :image => "http://t3.gstatic.com/images?q=tbn:ANd9GcQYxtzHJGG5qBR0K5gBbixfMfuDieHKYBoGMCBaIiGKQSRIV4CZ8w", :birthdate => "1978-04-19 00:00:00", :email => "carlagomez@gmail.com", :role => User::ROLE_TEACHER, :password => "123123", :password_confirmation => "123123")
User.create(name: "Mauro Icardi", birthdate: nil, image: nil,  email: "peliculasfinaldvd@gmail.com", login_count: 1, failed_login_count: 0, last_request_at: "2014-07-30 02:42:45", current_login_at: "2014-07-30 01:49:59", last_login_at: nil, current_login_ip: "127.0.0.1", last_login_ip: nil, created_at: "2014-07-30 01:49:59", updated_at: "2014-07-30 02:42:45", role: 5, description: "Futbolista en el Inter", facebook_id: 666474016767940)

Course.create(name: "Guitarra para principiantes", description: "Curso de guitarra en zona sur", longitude: -58.3887, latitude: -34.8029, address: "Avenida Tomás Espora 1007, Adrogué, Buenos Aires Province, Argentina", subcategory_id: 1, price: 150)
Course.create(name: "Super curso de guitarra", description: "Aprende las canciones que te gustan", longitude: -58.39121840000001, latitude: -34.7970765,  address: "Mitre 1230, Adrogué, Buenos Aires Province, Argentina", subcategory_id: 1, price: 90)
Course.create(name: "Curso de Piano clásico", description: "Curso de piano, nivel avanzado", longitude: -58.38872439999999, latitude: -34.8103353, address: "Avenida Tomás Espora 1507, Adrogué, Buenos Aires Province, Argentina", subcategory_id: 2, price: 350)
Course.create(name: "Aprenda ingles con Miss Carla", description: "Clases de ingles para escolares", longitude: -58.3792534, latitude: -34.7678337, address: "Temperley, Buenos Aires Province, Argentina", subcategory_id: 4, price: 200)

#CourseStudent.create(:student_id => 1, :course_id => 1)
CourseTeacher.create(:teacher_id => 1, :course_id => 1)
CourseTeacher.create(:teacher_id => 2, :course_id => 4)

Opinion.create(description: "100% recomendado! El profe un genio!", course_id: 2, date: Time.now - 2, rating: 4)
Opinion.create(description: "El profesor explica muy bien!", course_id: 2, date: Time.now - 3, rating: 5)
Opinion.create(description: "El profesor sabe mucho pero no explica bien", course_id: 1, date: Time.now - 1, rating: 2)
Opinion.create(description: "El profesor es un ladrón!", course_id: 1, date: Time.now - 5, rating: 1)
