class ApplicationController < ActionController::Base
  
  include SessionsHelper

  private

  def require_user_logged_in
    # ログインしていないと、ログインURLにリダイレクトさせる。
    unless logged_in?
      redirect_to login_url
    end
  end
end
