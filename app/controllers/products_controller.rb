class ProductsController < ApplicationController


  def new
    @product = Product.new
  end

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

end
