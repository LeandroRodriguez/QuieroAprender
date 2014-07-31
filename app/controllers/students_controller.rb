class StudentsController < ApplicationController
  authorize_resource
  
  def show
	  @student = Student.find(params[:id])
	  @populares = Course.joins(:opinions).order("avg(opinions.rating) desc").group("course_id").limit(3).to_a
  end

end
