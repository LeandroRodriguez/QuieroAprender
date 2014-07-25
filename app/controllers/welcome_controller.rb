#encoding: utf-8
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
		@radio = (params[:radio].nil?) ? 5 : params[:radio].to_i
		@buscarTodas = (params[:buscarTodas] == "true") ? true : false
		@ordenRating = (params[:ordenRating] == "true") ? true : false

		cursos = Course.all.to_a
		cursos.sort!{|x,y| y.get_rating_average <=> x.get_rating_average} if @ordenRating

		cursos.each do |c|
			distance = Geocoder::Calculations.distance_between([c.latitude, c.longitude], [@search_address.latitude, @search_address.longitude], {:units => :km}) if (not c.latitude.nil? and not c.longitude.nil?)
			if (distance < @radio) and (@buscarTodas or (c.subcategory_id.to_s == @subcategory_id))
				@results.push(c)
			end
		end
	end
end
