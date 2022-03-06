# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      login(user)
      params[:session][:remember] == '1' ? remeber(user) : forget(user)
      redirect_to root_path
      flash[:success] = 'ログインしました'
    else
      flash[:danger] = 'ログイン情報を間違えています。正しく入力してください。'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to login_url
    flash[:danger] = 'ログアウトしました'
  end
end
