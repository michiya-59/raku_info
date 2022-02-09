# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :attribute_get_path
  include(SessionsHelper)

  def redirect_not_logged_in
    return if current_user

    redirect_to login_path
    flash[:not_login] = 'ログインされてません。ログインしてください。'
  end

  def attribute_get_path
    @path = request.path_info
  end
end
