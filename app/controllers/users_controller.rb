class UsersController < ApplicationController
    def login
        if(!session['user_id'].nil?)
            redirect_to '/'
        end
    end


    def authenticate
        data = params[:user]
        @user = User.where(email:data[:email]).first;
        if((!@user.nil?)&& @user.authenticate(data[:password]))
            session['user_id'] = @user.id;
            redirect_to '/home'
            return;
        end
        redirect_to '/login'
    end
    
end
