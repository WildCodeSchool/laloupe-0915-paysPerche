class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  #custom devise permited params
  before_filter :set_locale, :configure_devise_permitted_parameters, if: :devise_controller?

  def authenticate_admin!
    unless current_user.is_admin
      redirect_to root_path, notice: "Désolé, vous n'êtes pas Admin."
    end
  end

  def set_locale
    I18n.locale = params[:fr]
  end

  protected
  def configure_devise_permitted_parameters
    permitted_params = [:email, :password, :password_confirmation, :first_name, :last_name, :function, :phone]
    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(permitted_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(permitted_params) 
      }
    end
  end
end
