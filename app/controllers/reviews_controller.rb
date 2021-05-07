class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_review_author, only: [:edit, :update, :destroy]
 
   def index
        if params[:critic_id] && @critic = Critic.find_by_id(params[:critic_id])
            @reviews = @critic.reviews
        else
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
    
   end
 
   def edit
    
   end
 
   def update
     if @review.update(review_params)
       redirect_to review_path(@review)
     else
       render :edit
     end
   end

   def destroy
        if @review = Review.find_by_id(params[:id])
            @review.destroy
            redirect_to reviews_path
        else
            flash[:message] = "Couldn't delete review"
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