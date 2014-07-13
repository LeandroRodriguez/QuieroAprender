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
      flash[:notice] = "Bienvenido " +  username + "!"
      redirect_back_or_default root_url
    else
      flash[:error] = "Email o password invalido"
      # Redirect to not display the error messages in the view
      #redirect_to login_url
      render :action => :new
    end
  end

  def destroy
    if current_user_session
      current_user_session.destroy
    else
      #destroy facebook session
      session[:oauth] = nil
      session[:access_token] = nil
    end
    flash[:notice] = "Se ha deslogueado"
    redirect_back_or_default :root
  end
end
