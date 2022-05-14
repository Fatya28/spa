# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :home

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end
end
