require 'koala'

class UserFacebookSessionsController < ApplicationController
  def index

  end

  def login
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
      redirect_to :fb_authorization and return
    end

    respond_to do |format|
      format.html {   }
    end
  end

  def authorization
    session[:oauth] = Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::SECRET, Facebook::SITE_URL)
    @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream publish_stream")

    redirect_to @auth_url
  end
  
end
