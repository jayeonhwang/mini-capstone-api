class ProductsController < ApplicationController
  def index
    @products = Product.all 
    render template: "products/index"
  end
  def show
    @product = Product.find_by(id:params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id],
    )

    if @product.save
      params[:images].each do |image|
        image = Image.new(
          url: image,
          product_id: @product.id,
        )
        image.save
      end
     render template:"products/show"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update 
    @product = Product.find_by(id:params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    
    if @product.save
      params[:images].each do |image|
        image = Image.new(
          url: image,
          product_id: @product.id,
        )
        image.save
      end
      render template: "products/show"
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message:"product destoryed"}
  end
end
