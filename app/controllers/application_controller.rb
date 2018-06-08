class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DeviseWhitelist

	 before_action :set_source

  def set_source
  	## set sessions if it exists  	
  	session[:source] = params[:q] if params[:q]
  end

  ### run this before all other controllers
  ### :devise_controller


    #before_action :configure_permitted_parameters, if: :devise_controller?

  #def configure_permitted_parameters
   # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  #end

end
