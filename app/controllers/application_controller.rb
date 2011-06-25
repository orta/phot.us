class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  
  before_filter :get_owner
  before_filter :is_mobile
  
  def get_owner
    if request.subdomain.size > 1
      @owner = request.subdomain
    else 
      @owner = request.host.split(".").first
    end
  end
  
  def is_mobile
    agent = request.headers["HTTP_USER_AGENT"].downcase
    browsers = ["android", "ipod","blackberry", "smartphone", "ipad"]
    browsers.each do |m|
      agent.match(m)? @is_mobile = true : @is_mobile = false;
    end
  end
end
