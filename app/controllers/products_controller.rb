class ProductsController < ApplicationController
  def index
    @products = Product.all 
    render template: "products/index"
  end
  def show
    @product = Product.first
    render template: "products/show"
  end

  def second
    @product = Product.second
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render template: "products/show"
  end
  
end
