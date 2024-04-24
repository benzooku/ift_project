class ApplicationController < ActionController::Base
  around_action :switch_locale


  # def default_url_options
  #    { locale: I18n.locale }
  # end
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  protected

  def sign_in_gate!
    session[:fall_back_path] = request.path
    authenticate_user!
  end


end
