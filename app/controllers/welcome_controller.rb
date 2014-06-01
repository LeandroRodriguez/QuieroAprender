class WelcomeController < ApplicationController
	def index
		# Aca deberian estar los cursos que matchean lo que el user busca
		@courses = Course.all
		@hash = Gmaps4rails.build_markers(@users) do |course, marker|
			marker.lat course.latitude
			marker.lng course.longitude
		end
	end
end
