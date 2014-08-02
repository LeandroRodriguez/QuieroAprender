class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user_session, :current_user

  #---<Perms>---
  #authorize_resource
  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  #---</Perms>---

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  private
    # Because of some reason, current_user methods were not working right in some places, 
    # so must also add a check for null value cases, as it take it as define and returns the null value
    def current_user_session
      return @current_user_session if (defined?(@current_user_session) && @current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if (defined?(@current_user) && @current_user)
      @current_user = current_user_session && current_user_session.user
      #check for facebook session
      if (!@current_user && session[:access_token])
        @api = Koala::Facebook::API.new(session[:access_token])
        @user_profile = @api.get_object("me")
        @current_user = User.find_by_email(@user_profile["email"])
      end
      #puts "User prev: #{@current_user.name}"
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "Debes estar logueado para acceder a esta pagina"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "No puedes estar logueado para acceder a esta pagina"
       # redirect_to home_index_path
        return false
      end
    end

    def store_location
      #session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
  
end
