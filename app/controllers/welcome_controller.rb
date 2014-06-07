class WelcomeController < ApplicationController
	def index
		# Aca deberian estar los cursos que matchean lo que el user busca
		@courses = Course.all
		@categories = Category.all
		@subcategories = Category.find(1).subcategories
	end

	def update_subcategories
		puts "update_subcategories id = #{params[:category_id]}"
		category = Category.find(params[:category_id])
		@subcategories = category.subcategories.map{|a| [a.name, a.id]}
		puts "update_subcategories #{@subcategories}"
	end
end
