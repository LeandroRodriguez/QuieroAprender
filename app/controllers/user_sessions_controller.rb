require 'koala'

class UserSessionsController < ApplicationController
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
  
  def index
    
  end

  def facebook_login
    if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end

    # auth established, now do a graph call:
    @api = Koala::Facebook::API.new(session[:access_token])

    begin
      @user_profile = @api.get_object("me")
    rescue Exception=>ex
      puts ex.message
      #if user is not logged in and an exception is caught, redirect to the page where logging in is requested
      redirect_to '/user/facebook_authorization' and return
    end

    respond_to do |format|
      format.html {   }
    end
  end

  def facebook_authorization
    session[:oauth] = Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::SECRET, Facebook::SITE_URL)
    @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream publish_stream")

    redirect_to @auth_url
  end
end
