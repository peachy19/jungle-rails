class Admin::DashboardController < ApplicationController
    USER, PASSWORD = 'jungle', 'book'
  before_filter :authentication_check
  def show
  end
    def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end
end
