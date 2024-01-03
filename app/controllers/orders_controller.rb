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
  
  def create
    if current_user
      @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      )

      if @order.save
        render json:{message:"create order"}
      else
        render json: { message: "error saving order", errors: @order.errors.full_messages }
      end

    else
      render json:{message: 'please login'}
    end
  end

  end

end
