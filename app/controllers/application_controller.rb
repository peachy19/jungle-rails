class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  USER, PASSWORD = ENV["USERNAME"], ENV["PASSWORD"]


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # puts @current_user
    # @current_user
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end


  private

  def cart
    # value = cookies[:cart] || JSON.generate({})
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end


end
