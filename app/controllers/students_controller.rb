class StudentsController < ApplicationController
  authorize_resource
  
  def show
	  @student = Student.find(params[:id])
  end

end
