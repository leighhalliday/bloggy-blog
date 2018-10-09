class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_country

  def default_url_options(options = {})
    { protocol: :https }.merge(options)
  end

  def set_country
    @country = request.env["HTTP_CF_IPCOUNTRY"].presence || '??'
  end
end
