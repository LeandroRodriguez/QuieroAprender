require 'koala'

class UserFacebookSessionsController < ApplicationController
  authorize_resource :class => false
  #before_filter :parse_facebook_cookies
  
  def index

  end

  def parse_facebook_cookies
    #@oauth = Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::SECRET)
    # If you've setup a configuration file as shown above then you can just do
    @oauth = Koala::Facebook::OAuth.new
    puts "Facebook OAuth Session: #{@oauth}"
    begin
      @facebook_cookies ||= @oauth.get_user_info_from_cookie(cookies)
      puts "Facebook cookies: #{@facebook_cookies}"
    rescue Exception=>ex
      puts "Facebook cookie parse exception: #{ex.message}"
    end
  end

  def login
    puts "Code params: #{params[:code]}"
    if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end
    parse_facebook_cookies
    # auth established, now do a graph call:
    @api = Koala::Facebook::API.new(session[:access_token])
    puts "Koala Facebook API: #{@api}"
    
    begin
      @user_profile = @api.get_object("me")
      puts "User profile: #{@user_profile}"
      user = User.new
      user.create_from_facebook(@user_profile)
      redirect_to :root
    rescue Exception=>ex
      puts "User profile exception: #{ex.message}"
      #if user is not logged in and an exception is caught, redirect to the page where logging in is requested
      redirect_to :fb_authorization and return
    end

    respond_to do |format|
      format.html {   }
    end
  end

  def logout
    session[:oauth] = nil
    session[:access_token] = nil
    redirect_to :root
  end

  def authorization
    session[:oauth] = Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::SECRET, Facebook::SITE_URL+'fb_authorization_callback')
    puts "Facebook OAuth Session: #{session[:oauth]}"
    auth_url = session[:oauth].url_for_oauth_code(:permissions=>"public_profile email user_friends publish_actions")
    redirect_to auth_url
  end
  
  def authorization_callback
    session[:access_token] = session[:oauth].get_access_token(params[:code])
    puts "Facebook Access Token: #{session[:access_token]}"
    redirect_to :root
  end
  
  # Publish to wall post
  # Params:
  # +message+:: Wall post message
  # +:attachment+:: Wall post attributes in hash
  #               { "name" => "Link name"
  #                 "link" => "http://www.example.com/",
  #                 "caption" => "{*actor*} posted a new review",
  #                 "description" => "This is a longer description of the attachment",
  #                 "picture" => "http://www.example.com/thumbnail.jpg"
  #               }
  def publish_wall_post
    puts "Publish wall post params: #{params}"
    if !session[:access_token] then
      authorization
    end
    puts "Facebook Access Token: #{session[:access_token]}"
    @graph = Koala::Facebook::API.new(session[:access_token])
    puts "Graph API: #{@graph}"
    session[:fb_permissions] = @graph.get_connections('me','permissions') unless session[:fb_permissions]
    puts "Facebook Permissions: #{session[:fb_permissions]}"
    if params[:message] then
      if params[:attachment] then
        @graph.put_wall_post(params[:message], params[:attachment])
      else
        @graph.put_wall_post(params[:message])
      end
    end
    #redirect_to :root
  end

end