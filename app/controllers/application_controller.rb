class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  private

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized, please sign in!"
      redirect_to login_path
    end
  end

  def require_current_user
    unless params[:id] == current_user.id.to_s
      flash[:error] = "You're not authorized to view this"
      redirect_to root_url
    end
  end 


  REGIONS = { 0: "U.S. Service Schools",
              1: "New England",
              2: "Midatlantic",
              3: "Great Lakes",
              4: "Plains",
              5: "Southeast",
              6: "Southwest",
              7: "Rocky Mountains",
              8: "Far West",
              9: "Outlying Areas"
            }

  def region_id_translate(input)
    if input.is_a? Integer
      REGIONS[input]
    else
      REGIONS.key(input)
    end
  end

  def school_regions
    regions = []
    REGIONS.each do |k,v|
      regions << [v,k]
    end
    regions
  end
  helper_method :school_regions

  LOCALES = {13: "City",
             23: "Suburb",
             33: "Town",
             43: "Rural"}

  def locale_types
    locales = []
    LOCALES.each do |k,v|
      locales << [v,k]
    end
    locales
  end

end
