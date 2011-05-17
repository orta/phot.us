class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  
  before_filter :get_owner
  
  def get_owner
    @owner = request.subdomain || request.host.split(".").first
  end
  
end
