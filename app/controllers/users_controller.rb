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
            redirect_to '/'
            return;
        end
        redirect_to '/login'
    end


    def create
        data = params[:user]
        @user = User.create(
            full_name:data[:full_name],
            email:data[:email],
            address:data[:address],
            password:data[:password],
            password_confirmation:data[:password_confirmation],
        );
        if(!@user.nil?)
            session['user_id'] = @user.id;
            plan = @user.plan.build();
            plan.save;
            redirect_to '/'
            return;
        end
        redirect_to '/register'
    end
    
end
