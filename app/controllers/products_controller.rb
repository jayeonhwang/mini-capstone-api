class ProductsController < ApplicationController
  def index
    @products = Product.all 
    render template: "products/index"
  end
  def show
    @product = Product.first
    render template: "products/show"
  end
end
