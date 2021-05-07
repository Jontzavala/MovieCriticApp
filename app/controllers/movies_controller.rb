class MoviesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_movie_author, only: [:edit, :update, :destroy]

    def new
        @movie = Movie.new
    end

    def index
        if params[:critic_id] && @critic = Critic.find_by_id(params[:critic_id])
           @movies = @critic.movies.alpha
        else
          @error = "That Critic doesn't exist" if params[:critic_id]
          @movies = Movie.alpha
        end
    
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
        
    end

    def edit
        
    end

    def update
       if @movie.update(movie_params)
         redirect_to movie_path(@movie)
       else
         render :edit
       end
    end

    def destroy
        if @movie = Movie.find_by_id(params[:id])
            @movie.destroy
            redirect_to movies_path
        else
            flash[:message] = "Couldn't delete movie"
            render :edit
        end
    end


    private

    def movie_params
        params.require(:movie).permit(:title, :description)
    end

    def set_movie
        @movie = Movie.find_by_id(params[:id])
        if !@movie
            flash[:message] = "Movie was not found"
            redirect_to movies_path
        end
    end

    def redirect_if_not_movie_author
        redirect_to movies_path if @movie.critic != current_critic
    end

end
