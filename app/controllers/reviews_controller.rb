class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:show, :edit, :update]
    before_action :redirect_if_not_review_author, only: [:edit, :update]
 
   def index
        if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
            @reviews = @movie.reviews
        else
            @error = "We don't seem to have that movie" if params[:movie_id]
            @reviews = Review.all
        end
    end
 
   def new
        if params[:movie_id] && @movie = Movie.find_by_id(params[:movie_id])
            @review = @movie.reviews.build
        else
            @review = Review.new
        end
    end
 
   def create
     @review = current_critic.reviews.build(review_params)
     if @review.save
       redirect_to reviews_path
     else
       render :new
     end
   end
 
 
   def show
    @review = Review.find_by(id: params[:id])
   end
 
   def edit
    @review = Review.find_by(id: params[:id])
   end
 
   def update
     if @review.update(review_params)
       redirect_to review_path(@review)
     else
       render :edit
     end
   end
 
   private
 
   def review_params
     params.require(:review).permit(:content,:movie_id)
   end
 
   def set_review
     @review = Review.find_by(id: params[:id])
     if !@review
       flash[:message] = "Review was not found"
       redirect_to reviews_path
     end
   end
 
   def redirect_if_not_review_author
      redirect_to reviews_path if @review.critic != current_critic
   end
end