class MoviesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @movie = Movie.new
    end

    def index
        if params[:critic_id] && @critic = Critic.find_by_id(params[:critic_id])
           @movies = @critic.movies.alpha
        else
          @error = "That Critic doesn't exist" if params[:critic_id]
          @movies = Movie.includes(:critic)
        end
    
        #@posts = @posts.search(params[:q].downcase) if params[:q] && !params[:q].empty?
        #@posts = @posts.filter(params[:post][:category_id]) if params[:post] && params[:post][:category_id] != ""
    
    end

    def create
        @movie = current_critic.movies.build(movie_params)
        if @movie.save
            redirect_to movies_path
        else
            render :new
        end
    end

    def show
        @movie = Movie.find_by_id(params[:id])
        redirect_to movies_path if !@movie
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :description)
    end
end
