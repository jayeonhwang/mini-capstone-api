class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end
  
  def show
    @order = Order.find_by(id: params[:id])
    if current_user == @order.user_id
      render :show
    else
      render json:{message:"you can't do this"}
    end
  end

  
  def create
    current_user
      @order = Order.new(
      user_id: current_user.id,
      subtotal: product.price 
      tax: 10,
      total: 10 
    )
    render json:{message: "hello"}
  
  end


end
