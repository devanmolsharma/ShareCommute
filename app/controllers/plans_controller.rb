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
end
