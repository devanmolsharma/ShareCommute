require 'set'


class RidesController < ApplicationController
    def index
        id = session['user_id'];
        if(id.nil?)
            redirect_to '/login'
            return
        end
        offset = 0;
        @page = params[:page];
        if(!@page.nil?) 
            offset = 20*(@page.to_i-1);
            @page = @page.to_i
        else
            @page = 1;
        end
        
        @rides = getRides.all.limit(20).offset(offset);
        @isLastPage = (getRides.all.limit(20).offset(offset+20).count) == 0;
        @newRides = getRides.where("created_at <= ?",3.days.ago).order(:created_at).limit(20);
        @updatedRides = getRides.where("updated_at <= ?",3.days.ago).order(:updated_at).limit(20);
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

    def addToPlan()
        itemId = params[:id];
        id = session['user_id'];
        ride = Ride.find(itemId)
        @user= User.find(id);
        conn = Connection.where(user_1_id:[ride.user.id,@user.id]).or(Connection.where(user_2_id:[ride.user.id,@user.id])).first;
        trip = @user.plan.trips.build(
            connection:conn,
            ride:ride,
            seats:2,
            )
        trip.save;
            redirect_to '/plan'
        end


    def view
        @ride = Ride.find(params[:ride_id])
    end
end
