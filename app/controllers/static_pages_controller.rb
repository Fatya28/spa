# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home; end

  def help; end

  def gallery; end
end
