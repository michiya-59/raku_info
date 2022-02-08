# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def user_confirm_new
    @user = User.new(users_params)
    render 'new' unless @user.valid?
  end

  def create
    @user = User.new(users_params)
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
