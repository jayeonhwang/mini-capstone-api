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
    @carted_products = CartedProduct.where(user_id: current_user.id , status: "carted")
    calculated_subtotal = 0

    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal


    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save

    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
      @carted_products.each do |carted_product|
        carted_product.status = "purchased"
        carted_product.order_id = @order.id
        carted_product.save
      end

    render :show
  end
    


end
