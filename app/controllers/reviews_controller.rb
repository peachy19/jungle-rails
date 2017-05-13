class ReviewsController < ApplicationController
   # before_action :set_review

def new
  @review = Review.new
end
  def create
    product = Product.find(params[:product_id])
    puts reviews_params
    review = product.reviews.new(reviews_params)
    review.user = current_user
    if review.save
      redirect_to product

    end
  # raise "Yay, I'm here!"
  end


  private
    #   # Use callbacks to share common setup or constraints between actions.
    # def set_review
    #   @review = Review.find(params[:id])
    # end

  def reviews_params
    params.require(:review).permit(
      :description,
      :rating)
  end
end
