# frozen_string_literal: true

module SessionsHelper
  def login(user)
    session[:user_id] = user
  end

  def remeber(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        login(user)
        @current_user = user
      end
    end
    @current_user
  end

  def logout
    current_user && forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
end
