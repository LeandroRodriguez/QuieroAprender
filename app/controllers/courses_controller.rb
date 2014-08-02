class CoursesController < ApplicationController
  puts "al"
  authorize_resource
  puts "lo"
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, :only => :new
  #examples
  #before_filter :require_user, :all
  #before_filter :require_user, :except => [:show, :index]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
   @course = Course.find(params[:id])
   @advertisings = []
   getAdvertising(@course, @advertisings)
   @cursosRelacionados = []
   getCursosRelacionados(@course, @cursosRelacionados)
   @opinion = Opinion.new
   @consultation = Consultation.new
   @rating_average = @course.get_rating_average
  end

  def getAdvertising(course, advertisings)
#    @course.tags.each do |t|
      @advertisings = Advertising.all   
#    end 
  end 

  def getCursosRelacionados(course, cursosRelacionados) 
#    @course.tags.each do |t|
      @cursosRelacionados = Course.all   
#    end
  end  

  # GET /courses/new
  def new
    @course = Course.new
    @categories = Category.all
    @subcategories = Category.find(1).subcategories
    @posibleTags=Tag.all.map{|a| a.name}
    @selectedTags=[]
  end

  # GET /courses/update_subcategories_courses
  def update_subcategories_courses
    category = Category.find(params[:category_id])
    @subcategories = category.subcategories.map{|a| [a.name, a.id]}
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
    @categories = Category.all
    @subcategories = Category.find(1).subcategories
    @posibleTags=Tag.all.map{|a| a.name}
    @selectedTags= []
  end

  # GET /courses/enroll
  def enroll
    @course = Course.find(params[:id])
    if(current_user && (current_user.role == User::ROLE_STUDENT)) 
       @courseStudent = CourseStudent.new(:course_id => @course.id, :student_id => current_user.id) 
       @courseStudent.save
       flash[:info] = "Se inscribio correctamente!"
       session["courseId"] = nil 
    else
      flash[:error] = "Debe ser un estudiante logueado para inscribirse"
      session["courseId"] = params[:id]
    end 
    redirect_to @course
  end  

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    setTags(@course)
    respond_to do |format|
      if @course.save
        if(current_user && current_user.role == User::ROLE_TEACHER) 
           @courseTeacher = CourseTeacher.new(:course_id => @course.id, :teacher_id => current_user.id) 
           @courseTeacher.save
        end   
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def setTags(course)
    params[:selectedTags].gsub!(/\s/,'')
    tags = params[:selectedTags].split(',')
    tags.each do |t|
    tag = Tag.find_by_name(t)
      @course.tags << tag
    end 
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    setTags(@course)
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_course
 #     @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :longitude, :latitude, :address, :subcategory_id, :price, :tags, :opinions, :consultations,:uploads)
    end
end
