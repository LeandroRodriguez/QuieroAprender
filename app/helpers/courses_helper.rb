module CoursesHelper

	def is_friends_have_taken_a_course(course)
		friends_count = rand(4);
	end

	def string_count_of_friends_taken_a_course
		friends_count = 1 + rand(3)
		if friends_count == 1 then
			return "Un amigo ha realizado este curso"
		end
		if friends_count > 1 then
			return "#{friends_count} amigos han realizado este curso"
		end
	end

end
