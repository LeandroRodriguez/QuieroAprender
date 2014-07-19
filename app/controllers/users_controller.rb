class UsersController < ApplicationController
  authorize_resource
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
	    id = @user.id	

	    if user_params[:role].to_i == User::ROLE_STUDENT
		    insert_sql = "insert into quiero_aprender.students (id) values (#{id})"
      elsif user_params[:role].to_i == User::ROLE_TEACHER
		    insert_sql = "insert into quiero_aprender.teachers (id) values (#{id})"
      end

	    if insert_sql
	      ActiveRecord::Base.connection.execute insert_sql
	    end
	    flash[:notice] = "Your account has been created"
   	  redirect_to :root
    else
	    flash[:notice] = "There was a problem creating you."
	    render :action => :new
    end
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    

  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(user_params)
      flash[:notice] = "Account updated!"
      redirect_to home_url
    else
      render :action => :edit
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :description, :birthdate, :image)
    end
  
  #def show
  #  @user = User.find(params[:id])
  #end
  
end
