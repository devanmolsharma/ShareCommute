class PlansController < ApplicationController
    def index
        id = session['user_id'];
        @user= User.find(id);
        @plan = @user.plan;
        if(@plan.nil?)
            @plan = Plan.new(
                user:@user
            )
            @plan.save;
        end
        @trips = @plan.trips;
    end


    def remove
        trip = Trip.find(params[:id]);
        trip.destroy
        redirect_to '/plan'
    end

    def changeSeats
        trip = Trip.find(params[:id]);
        trip.seats = params[:seats];
        trip.save;
        redirect_to '/plan'
    end
end
