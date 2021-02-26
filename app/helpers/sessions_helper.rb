module SessionsHelper

    # Create a session
    def log_in(user)
        session[:user_id] = user.id
      end
    
      # Returns current user if in session
      def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
      end
    
      # Returns true or false
      def logged_in?
        !current_user.nil?
      end
    
      # delete session, logout user/ set current_user to nil
      def log_out
        session.delete(:user_id)
        @current_user = nil
      end
    
      # Returns true uf user=curr_user = restrict user from visiting other users details
      def current_user?(user)
        user == current_user
      end
    
      # Re-direct not logged user to the first visited url after loggin in
      def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
      end
    
      def store_location
        session[:forwarding_url] = request.original_url if request.get?
      end
end
