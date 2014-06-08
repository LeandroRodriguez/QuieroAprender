class WelcomeController < ApplicationController
	def index
		# Aca deberian estar los cursos que matchean lo que el user busca
		@courses = Course.all
		@categories = Category.all
		@subcategories = Category.find(1).subcategories
	end

	def update_subcategories
		category = Category.find(params[:category_id])
		@subcategories = category.subcategories.map{|a| [a.name, a.id]}
	end

	def decode_address
		@search_address = Geocoder.search(params[:address]).first
		puts "@search_address #{@search_address.latitude}, #{@search_address.longitude}"
		@address = {lat: @search_address.latitude, lng: @search_address.longitude}
		@results = []
		
		Course.all.to_a.each do |c|
			puts "course #{c.latitude}, #{c.longitude}"
			distance = @search_address.distance_from([c.latitude, c.longitude]) if (not c.latitude.nil? and not c.longitude.nil?)
			@results.push({lat: c.latitude, lng: c.longitude, name: c.name}) if (distance < 10000)
		end
	end
end
