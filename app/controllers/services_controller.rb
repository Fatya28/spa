# frozen_string_literal: true

class ServicesController < ApplicationController
  def index
    @services = if params[:category_id].present?
                  Service.all.where('category_id = ?', params[:category_id]).order(rating: :desc)
                else
                  Service.all.order(rating: :desc)
                end
    @categories = Category.all
  end

  def show
    @service = Service.find(params[:id])
  end
end
