class MastersController < ApplicationController
  def index
    @masters = User.master
  end

  def show
    @master = User.find(params[:id])
  end
end
