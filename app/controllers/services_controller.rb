# frozen_string_literal: true

class ServicesController < ApplicationController
  def index
    if params[:category_id].present?
      @services = Service.all.where("category_id = ?", params[:category_id]).order(rating: :desc)
    else
      @services = Service.all.order(rating: :desc)
    end
    @categories = Category.all
  end

  def show
    @service = Service.find(params[:id])
  end
end
