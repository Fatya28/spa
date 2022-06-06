# frozen_string_literal: true

class MastersController < ApplicationController
  def index
    @masters = User.master.order(rating: :desc)
  end

  def show
    @master = User.find(params[:id])
  end
end
