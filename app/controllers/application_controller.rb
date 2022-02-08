# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :attribute_get_path
  include(SessionsHelper)

  def attribute_get_path
    @path = request.path_info
  end
end
