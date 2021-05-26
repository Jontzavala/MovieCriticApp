module MoviesHelper
    def display_index_header
        if @critic == current_critic
            "#{@critic.username}'s Movies"
        else
            "All Movies"
        end
    end

    def display_movies
        if @critic.movies.empty?
          (link_to('No movies yet - create a movie here', new_movie_path))
        else
          critic = @critic == current_critic ? 'Your' : "#{@critic.username}'s"
          "#{critic} #{pluralize(@critic.movies.count, 'Movie')}:"
    
        end
    end
end
