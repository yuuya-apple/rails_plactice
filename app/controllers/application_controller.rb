# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @currnt_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
