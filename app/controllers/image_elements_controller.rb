class ImageElementsController < ApplicationController

    def create
        if current_critic
            movie = Movie.find_by_id(params[:id])
            movie.image_elements.create
            redirect_to movie_path(@movie)
        else
            redirect_to movies_path
        end
    end

    def update
        if current_critic
            movie = Movie.find_by_id(params[:id])
            image_elements = movie.image_elements.find(params[:id])
            if image_element.image.attach(image_element_params[:image])
                redirect_to movie_path(@movie)
            else
                redirect_to movies_path
            end
        else
            redirect_to movies_path
        end
    end


end