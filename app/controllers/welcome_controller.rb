class WelcomeController < ApplicationController
  authorize_resource :class => false
  
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
		@subcategory_id = params[:subcategory_id]
		@results = []
		
		Course.all.to_a.each do |c|
			distance = Geocoder::Calculations.distance_between([c.latitude, c.longitude], [@search_address.latitude, @search_address.longitude], {:units => :km}) if (not c.latitude.nil? and not c.longitude.nil?)
			@results.push(c) if (distance < 10 and c.subcategory_id.to_s == @subcategory_id)
		end
	end
end
