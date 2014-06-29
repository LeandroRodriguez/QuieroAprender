class UserSessionsController < ApplicationController
  authorize_resource
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      username = ''
      if current_user
        username = current_user.email
      end
      flash[:notice] = "Welcome " +  username + "!"
      redirect_back_or_default root_url
    else
      flash[:error] = "Invalid username or password"
      # Redirect to not display the error messages in the view
      #redirect_to login_url
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
    #redirect_back_or_default login_url
  end
end
