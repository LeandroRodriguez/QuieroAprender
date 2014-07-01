class ConsultationsController < ApplicationController
	authorize_resource
	def create
		@course = Course.find(params[:course_id])
		@consultation = Consultation.new(params[:consultation])
		@consultation.date = DateTime.now
		if current_user
  			@consultation.user = current_user
		end
		@consultation.save
		@course.consultations << @consultation
		redirect_to @course
	end

	def consultation_params
      params.require(:consultation).permit(:description, :user , :course_id)
    end
end
