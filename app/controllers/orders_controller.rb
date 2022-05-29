# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @masters = User.master
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @service = Service.find(params[:service_id])
    @masters = User.master.order(rating: :desc)
    @master = params[:master_id]
    disable_date = Order.select(:startdate).where('master_id = ? and startdate > current_date', @master)
    @disable_date = []
    i = disable_date.size - 1
    while i >= 0
      @disable_date.push(disable_date[i].startdate.to_s)
      i -= 1
    end
  end

  def create
    @masters = User.master
    @master = params[:master_id]
    @service = Service.find(params[:service_id])
    @order = @service.orders.create(order_params.merge(user_id: current_user.id, master_id: params[:master_id]))
    @order.nil?

    if @order.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:startdate, :service_id, :master_id, :user_id, params[:master_id])
  end
end
