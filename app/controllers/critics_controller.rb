class CriticsController < ApplicationController

    def new
        @critic = Critic.new
    end

    def create
        @critic = Critic.new(critic_params)
        if @critic.save
            session[:critic_id] = @critic.id
            redirect_to @critic
        else
            render :new
        end
    end

    def show
    end

    private

    def critic_params
        params.require(:critic).permit(:username, :email, :password)
    end

end
