require 'set'


class RidesController < ApplicationController
    def index
        id = session['user_id'];
        if(id.nil?)
            redirect_to '/login'
            return
        end
        @rides = getRides.all;
        @categories = Category.all;

    end
    
    def getRides
        @user = check_auth()
        @connection_ids = Set.new([]);
        Connection.where('(user_1_id = ? OR user_2_id = ?) AND connection_status = ?',@user[:id],@user[:id],'confirmed').all.each do |conn|
            @connection_ids.add(conn[:user_1_id])
            @connection_ids.add(conn[:user_2_id])
        end
        @connection_ids = @connection_ids.to_a()
        @connection_ids.delete(@user[:id])
        return Ride.where(user_id:@connection_ids);
    end


    def find
        if(!params[:cat].nil?)
            @rides = getRides.where(category_id:params[:cat]).where('LOWER(`to`) LIKE ?',"%#{params[:query]}%").all;
            return
        end
        @rides = getRides.where('LOWER(`to`) LIKE ?',"%#{params[:query]}%").all;
    end

    


    def check_auth
        id = session['user_id'];
        if(id.nil?)
            redirect_to '/login'
            return
        end
        usr = User.find(id)

        if(usr.nil?)
            redirect_to '/login'
            session.destroy()
            return
        end

        return usr 
    end


    def view
        @ride = Ride.find(params[:ride_id])
    end
end
