class ApplicationController < ActionController::Base
	 protect_from_forgery with: :exception
end
before_action :set_locale
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end