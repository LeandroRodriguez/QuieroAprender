#encoding: utf-8

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

#PROFES
User.create(:name => "Juan Perez", :description => "Profesor de guitarra. 12 años de experiencia", :image => "http://www.premierguitar.com/ext/resources/archives/81e5505d-a4b1-43f5-b7c0-69f7680c25cd.JPG?1371672480", :birthdate => "1966-07-08 00:00:00", :email => "juanperez@gmail.com", :role => User::ROLE_TEACHER, :password => "123123", :password_confirmation => "123123")
User.create(:name => "Carla Gomez", :description => "Profesora de ingles. 5 años viviendo en Inglaterra. Certificaciones internacionales", :image => "http://t3.gstatic.com/images?q=tbn:ANd9GcQYxtzHJGG5qBR0K5gBbixfMfuDieHKYBoGMCBaIiGKQSRIV4CZ8w", :birthdate => "1978-04-19 00:00:00", :email => "carlagomez@gmail.com", :role => User::ROLE_TEACHER, :password => "123123", :password_confirmation => "123123")
#ESTUDIANTES
User.create(:name => "Mauro Icardi", :description => "Jugador del Inter de Milan", :image => nil, :birthdate => "1990-04-16 00:00:00", :email => "peliculasfinaldvd@gmail.com", :role => User::ROLE_STUDENT, :password => "123123", :password_confirmation => "123123", :facebook_id => 666474016767940)

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
