class OrdersController < ApplicationController

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
      return render json:{message: 'please login'}
    end
  end

  def index
    if current_user
      @orders = Order.all
      render :index
    else
      render json:{message:"Please login"}
    end
  end

  def show
    if current_user
      @order = Order.find_by(id:params[:id])
      render :show
    else
      render json:{message:"Please login"}
    end
  end

end
