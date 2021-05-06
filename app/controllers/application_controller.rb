class ApplicationController < ActionController::Base

    helper_method :current_critic, :logged_in?

    private

    def current_critic
        @current_critic ||= Critic.find_by_id(session[:critic_id]) if session[:critic_id]
    end

    def logged_in?
        !!session[:critic_id]
    end

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end
end
