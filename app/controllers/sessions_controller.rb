class SessionsController < ApplicationController
    def home
    end
    
    def destroy
        session.clear 
        redirect_to root_path
    end

    def create
       critic = Critic.find_by(username: params[:critic][:username])
       if critic && critic.authenticate(params[:critic][:password])
        session[:critic_id] = critic.id
        redirect_to critic_path(critic)
       else
        flash[:message] = "Wrong Username or Password"
        redirect_to login_path
       end
    end

    def omniauth
        @critic = Critic.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |c|
            c.username = request.env['omniauth.auth'][:info][:first_name]
            c.email = request.env['omniauth.auth'][:info][:email]
            c.password = SecureRandom.hex(15)
        end
        if @critic.valid?
            session[:critic_id] = @critic.id
            redirect_to critic_path(@critic)
        else
            redirect_to login_path
        end
    end
end