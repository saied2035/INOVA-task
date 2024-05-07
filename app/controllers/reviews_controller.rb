class ReviewsController < ApplicationController

    def create
        story =  Story.find(params[:story_id])
        review = story.reviews.new(review_params)
      if review.save
        render json: review, status: :ok
      else
        render json: review.errors, status: 400  
      end  
    end

    private

    def review_params
      params.require(:review).permit(:rate, :comment)  
    end 

end
