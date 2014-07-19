class OpinionsController < ApplicationController
	authorize_resource
	def create
		@course = Course.find(params[:course_id])
		@opinion = Opinion.new(params[:opinion])
		p "params opinion #{params.inspect}"
		@opinion.date = DateTime.now
		if current_user
  			@opinion.user = current_user
		end
		@opinion.save
		@course.opinions << @opinion
		redirect_to @course
	end

	def opinion_params
      params.require(:opinion).permit(:description, :user , :course_id, :rating)
    end
end
