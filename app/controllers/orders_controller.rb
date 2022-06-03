# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index

    if params[:status].present?
      @orders = current_user.orders.status(Order::STATUSES.index(params[:status].to_sym))
    else
      @orders = current_user.orders
    end

    @masters = User.master
  end

  def update_status
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    redirect_to @order, notice: "Status Changed to #{@order.status}"
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @service = Service.find(params[:service_id])
    @masters = User.master.order(rating: :desc)
    @master = params[:master_id]
    disable_date = Order.not_cancel.select(:startdate).where('master_id = ? and startdate > current_date', @master)
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

    if @order.save
      flash[:success] = "Order created successfully."
      redirect_to @order
    else
      flash[:danger] = @order.errors.full_messages
      redirect_to new_service_order_path(master_id: params[:master_id])
    end
  end

  private

  def order_params
    params.require(:order).permit(:startdate, :service_id, :master_id, :user_id, params[:master_id])
  end
end
