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

Tag.create(:name => "Avanzado")
Tag.create(:name => "Intermedio")
Tag.create(:name => "Principiante")
Tag.create(:name => "Experiencia")
Tag.create(:name => "Para todas las edades")
Tag.create(:name => "Jóvenes")
Tag.create(:name => "Personas Mayores")
Tag.create(:name => "Niños")
Tag.create(:name => "Instrumentos")
Tag.create(:name => "Música")
Tag.create(:name => "Idiomas")
Tag.create(:name => "Materiales de estudio")

Plan.create(:name => "Visitas Básico", :type => "VisitsPlan", :price => 100.00, :active => true)
Plan.create(:name => "Visitas Full", :type => "VisitsPlan", :price => 300.00, :active => true)
Plan.create(:name => "Visitas Premium", :type => "VisitsPlan", :price => 1000.00, :active => true)
Plan.create(:name => "Inscripciones Básico", :type => "RegistrationsPlan", :price => 100.00, :active => true)
Plan.create(:name => "Inscripciones Full", :type => "RegistrationsPlan", :price => 300.00, :active => true)
Plan.create(:name => "Inscripciones Premium", :type => "RegistrationsPlan", :price => 1000.00, :active => true)

#PROFES
User.create(:name => "Juan Perez", :description => "Profesor de guitarra. 12 años de experiencia", :image => "guitar-teacher1.jpg", :birthdate => "1966-07-08 00:00:00", :email => "juanperez@gmail.com", :role => User::ROLE_TEACHER, :password => "123123", :password_confirmation => "123123")
User.create(:name => "Carla Gomez", :description => "Profesora de ingles y francés. 5 años viviendo en Europa. Certificaciones internacionales", :image => "english-teacher1.jpg", :birthdate => "1978-04-19 00:00:00", :email => "carlagomez@gmail.com", :role => User::ROLE_TEACHER, :password => "123123", :password_confirmation => "123123")
User.create(:name => "Amanda González", :description => "Profesora de piano. Reconocida internacionalmente.", :image => "profesoraPiano.jpg", :birthdate => "1950-04-19 00:00:00", :email => "amandaGonzalez@gmail.com", :role => User::ROLE_TEACHER, :password => "123123", :password_confirmation => "123123")

#ESTUDIANTES
User.create(:name => "Mauro Icardi", :description => "Jugador del Inter de Milan", :image => nil, :birthdate => "1990-04-16 00:00:00", :email => "peliculasfinaldvd@gmail.com", :role => User::ROLE_STUDENT, :password => "123123", :password_confirmation => "123123", :facebook_id => 666474016767940)
User.create(:name => "Esteban Garcia", :description => "Economista", :image => "economista.jpg", :birthdate => "1974-06-20 00:00:00", :email => "estebanGarcia@gmail.com", :role => User::ROLE_STUDENT, :password => "123123", :password_confirmation => "123123")
User.create(:name => "Susana Rinaldi", :description => "Jubilada", :image => "jubilada.jpg", :birthdate => "1950-09-16 00:00:00", :email => "susanaRinaldi@gmail.com", :role => User::ROLE_STUDENT, :password => "123123", :password_confirmation => "123123")
User.create(:name => "Lucas Estevez", :description => "Ingeniero", :image => "ingeniero.jpg", :birthdate => "1985-02-07 00:00:00", :email => "lucasEstevez@gmail.com", :role => User::ROLE_STUDENT, :password => "123123", :password_confirmation => "123123")
User.create(:name => "Micaela Baez", :description => "Estudiante de arte", :image => "estudianteArte.jpg", :birthdate => "1993-05-03 00:00:00", :email => "micaelaBaez@gmail.com", :role => User::ROLE_STUDENT, :password => "123123", :password_confirmation => "123123")

Course.create(name: "Guitarra para principiantes", description: "Curso de guitarra en zona sur", longitude: -58.3887, latitude: -34.8029, address: "Avenida Tomás Espora 1007, Adrogué, Buenos Aires Province, Argentina", subcategory_id: 1, price: 150)
Course.create(name: "Super curso de guitarra", description: "Aprende las canciones que te gustan", longitude: -58.39121840000001, latitude: -34.7970765,  address: "Mitre 1230, Adrogué, Buenos Aires Province, Argentina", subcategory_id: 1, price: 90)
Course.create(name: "Curso de Piano clásico", description: "Curso de piano, nivel avanzado", longitude: -58.38872439999999, latitude: -34.8103353, address: "Avenida Tomás Espora 1507, Adrogué, Buenos Aires Province, Argentina", subcategory_id: 2, price: 350)
Course.create(name: "Aprenda ingles con Miss Carla", description: "Clases de ingles para escolares", longitude: -58.3792534, latitude: -34.7678337, address: "Temperley, Buenos Aires Province, Argentina", subcategory_id: 4, price: 200)
Course.create(name: "Francés para todas las edades!", description: "Clases de francés en todos los niveles, para todas las edades. Más de 50 años de experiencia.", longitude: -58.3945, latitude: -34.7789, address: "Avenida Eva Perón, Temperley, Buenos Aires, Argentina 280", subcategory_id: 5, price: 300)

#CourseStudent.create(:student_id => 1, :course_id => 1)
CourseTeacher.create(:teacher_id => 1, :course_id => 1)
CourseTeacher.create(:teacher_id => 1, :course_id => 2)
CourseTeacher.create(:teacher_id => 2, :course_id => 4)
CourseTeacher.create(:teacher_id => 2, :course_id => 5)
CourseTeacher.create(:teacher_id => 3, :course_id => 3)

#Curso 1 - Guitarra
Opinion.create(description: "El profesor sabe mucho pero no explica bien", course_id: 1, date: Time.now - 1, rating: 2, user_id: 6)
Opinion.create(description: "El curso es muy interesante, se aprende un montón", course_id: 1, date: Time.now - 5, rating: 4, user_id: 4)
Consultation.create(description: "Buenas tardes, quería saber los días en los que se dicta el curso. Gracias!", course_id: 1, date: Time.now - 10, user_id: 8)
Consultation.create(description: "Buenas tardes Micaela, los cursos se dictan de lunes a viernes, en horarios acordados con el alumno. Saludos ", course_id: 1, date: Time.now - 3, user_id: 1)

#Curso 2 - Guitarra
Opinion.create(description: "100% recomendado! El profe un genio!", course_id: 2, date: Time.now - 2, rating: 4, user_id: 7)
Opinion.create(description: "El profesor explica muy bien!", course_id: 2, date: Time.now - 3, rating: 5, user_id: 5)

#Curso 4 - Ingles
Opinion.create(description: "Las profesoras son muy agradables, en la clase se habla todo el tiempo en inglés.", course_id: 4, date: Time.now - 10, rating: 4, user_id: 7)
Opinion.create(description: "Fue una buena experiencia, aunque hubiera preferido un curso más personalizado, con menos alumnos.", course_id: 4, date: Time.now - 5, rating: 3, user_id: 4)


#Imagenes curso
Upload.create(upload_file_name: "curso6.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 44974 ,upload_updated_at: "2014-08-03 19:43:22",course_id: 1 ,created_at: "2014-08-03 19:43:22" ,updated_at: "2014-08-03 19:43:22")
Upload.create(upload_file_name: "curso7.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 26901 ,upload_updated_at: "2014-08-03 19:43:22",course_id: 1 ,created_at: "2014-08-03 19:43:22" ,updated_at: "2014-08-03 19:43:22")
Upload.create(upload_file_name: "curso8.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 2729778 ,upload_updated_at: "2014-08-03 19:43:22",course_id: 1 ,created_at: "2014-08-03 19:43:22" ,updated_at: "2014-08-03 19:43:22")
Upload.create(upload_file_name: "curso3.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 16682 ,upload_updated_at: "2014-08-03 20:12:21",course_id: 4 ,created_at: "2014-08-03 20:12:21" ,updated_at: "2014-08-03 20:12:21")
Upload.create(upload_file_name: "curso4.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 29123 ,upload_updated_at: "2014-08-03 20:12:21",course_id: 4 ,created_at: "2014-08-03 20:12:21" ,updated_at: "2014-08-03 20:12:21")
Upload.create(upload_file_name: "curso1.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 577049 ,upload_updated_at: "2014-08-03 20:12:22",course_id: 4 ,created_at: "2014-08-03 20:12:22" ,updated_at: "2014-08-03 20:12:22")
Upload.create(upload_file_name: "curso_piano1.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 23420 ,upload_updated_at: "2014-08-03 20:15:39",course_id: 3 ,created_at: "2014-08-03 20:15:39" ,updated_at: "2014-08-03 20:15:39")
Upload.create(upload_file_name: "curso_piano2.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 48925 ,upload_updated_at: "2014-08-03 20:15:39",course_id: 3 ,created_at: "2014-08-03 20:15:39" ,updated_at: "2014-08-03 20:15:39")
Upload.create(upload_file_name: "curso_piano3.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 200566 ,upload_updated_at: "2014-08-03 20:15:39",course_id: 3 ,created_at: "2014-08-03 20:15:39" ,updated_at: "2014-08-03 20:15:39")
Upload.create(upload_file_name: "curso_piano4.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 72422 ,upload_updated_at: "2014-08-03 20:20:29",course_id: 2 ,created_at: "2014-08-03 20:20:30" ,updated_at: "2014-08-03 20:20:30")
Upload.create(upload_file_name: "curso_guitarra4.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 3626228 ,upload_updated_at: "2014-08-03 20:20:30",course_id: 2 ,created_at: "2014-08-03 20:20:30" ,updated_at: "2014-08-03 20:20:30")
Upload.create(upload_file_name: "curso2.jpg" ,upload_content_type: "image/jpeg" ,upload_file_size: 94068 ,upload_updated_at: "2014-08-03 20:20:30",course_id: 5 ,created_at: "2014-08-03 20:20:30" ,updated_at: "2014-08-03 20:20:30")
Upload.create(upload_file_name: "cursoFrances.jpeg" ,upload_content_type: "image/jpeg" ,upload_file_size: 27585 ,upload_updated_at: "2014-08-03 20:20:30",course_id: 5 ,created_at: "2014-08-03 20:20:30" ,updated_at: "2014-08-03 20:20:30")

#Advertisings
Advertising.create(name: "Guitarra Eléctrica", description: "Guitarra eléctrica, en perfecto estado, 3 pastillas, cuerdas marca fender. Buena calidad sonora. Incluye funda, púas y portapúas", address: "Temperley, Buenos Aires, Argentina", price: "200",image: "guitarraElectrica.jpg")
Advertising.create(name: "Teclado Piano Organo ENSONIQ", description: "Teclado de calidad profesional, fabricación americana. 76 teclas sensitivo, polifónico de 32 notas multitímbrico de 16 partes muy buen sonido de piano , 3 osciladores por sonido y percusión opción de ampliación de sonidos.
", address: "Lanús, Buenos Aires, Argentina", price: "300",image: "pianoOrgano.jpg")
Advertising.create(name: "Bateria", description: "Bateria marca SHOCK DRUM. Antigua pero bien conservada. Ideal principiantes. Pie de caja y pedal de bombo incluido. Color negro. Sonido contundente muy rockero.", address: "Lanús, Buenos Aires, Argentina", price: "500",image: "bateria.jpg")
Advertising.create(name: "Libros en inglés", description: "Libros para aprender inglés en todos los niveles.", address: "Lomas de Zamora, Buenos Aires, Argentina", price: "300",image: "librosIngles.jpg")
Advertising.create(name: "Libros en francés", description: "Libros para aprender francés en todos los niveles.", address: "Lomas de Zamora, Buenos Aires, Argentina", price: "200",image: "librosFrances.jpg")


#TAGS - Advertising
AdvertisingsTag.create(:advertising_id => 1, :tag_id => 9)
AdvertisingsTag.create(:advertising_id => 1, :tag_id => 10)
AdvertisingsTag.create(:advertising_id => 2, :tag_id => 9)
AdvertisingsTag.create(:advertising_id => 2, :tag_id => 4)
AdvertisingsTag.create(:advertising_id => 2, :tag_id => 10)
AdvertisingsTag.create(:advertising_id => 3, :tag_id => 9)
AdvertisingsTag.create(:advertising_id => 3, :tag_id => 10)
AdvertisingsTag.create(:advertising_id => 4, :tag_id => 11)
AdvertisingsTag.create(:advertising_id => 4, :tag_id => 12)
AdvertisingsTag.create(:advertising_id => 5, :tag_id => 11)
AdvertisingsTag.create(:advertising_id => 5, :tag_id => 12)

#TAGS - Course
CoursesTag.create(:course_id => 1, :tag_id => 3)
CoursesTag.create(:course_id => 1, :tag_id => 9)
CoursesTag.create(:course_id => 1, :tag_id => 10)
CoursesTag.create(:course_id => 1, :tag_id => 4)
CoursesTag.create(:course_id => 2, :tag_id => 9)
CoursesTag.create(:course_id => 2, :tag_id => 10)
CoursesTag.create(:course_id => 2, :tag_id => 2)
CoursesTag.create(:course_id => 3, :tag_id => 9)
CoursesTag.create(:course_id => 3, :tag_id => 10)
CoursesTag.create(:course_id => 3, :tag_id => 5)
CoursesTag.create(:course_id => 4, :tag_id => 5)
CoursesTag.create(:course_id => 4, :tag_id => 11)
CoursesTag.create(:course_id => 4, :tag_id => 12)
CoursesTag.create(:course_id => 5, :tag_id => 11)
CoursesTag.create(:course_id => 5, :tag_id => 12)
CoursesTag.create(:course_id => 5, :tag_id => 4)