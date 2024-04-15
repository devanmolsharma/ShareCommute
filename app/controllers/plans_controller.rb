class PlansController < ApplicationController
  def index
    id = session["user_id"]
    @user = User.find(id)
    @plan = @user.plans.where(status: "unpaid").first
    total = calculate_total
    taxes_total = calculate_taxes
    @plan.taxes = total * taxes_total
    @plan.total = total + total * taxes_total # Calculate total

    @plan.save
  end

  def past_orders
    id = session["user_id"]
    @user = User.find(id)
    @orders = @user.plans.where(status: "paid")
    return
  end


  def remove
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to "/plan"
  end

  def changeSeats
    trip = Trip.find(params[:id])
    trip.seats = params[:seats]
    trip.save
    redirect_to "/plan"
  end

  def finalise
    id = session["user_id"]
    @user = User.find(id)
    @plan = @user.plans.where(status: "unpaid").first
    @plan.status = "paid"
    @plan.save
    create_new_plan_unpaid
    redirect_to "/order_success"
  end

  def order_success
    id = session["user_id"]
    @user = User.find(id)
    @plan = @user.plans.where(status: "paid").last
  end

  private

  def calculate_taxes
    # Calculate taxes based on user's province
    # For example:
    user_province = @user.province
    taxes = (user_province.gst + user_province.pst) / 100.0
    taxes
  end

  def calculate_total
    # Calculate total based on some logic
    # For example, sum of all trip costs in the plan
    total = @user.plans.where(status: "unpaid").first.trips.sum(:cost)
    total
  end


  def create_new_plan_unpaid
    p = Plan.new(user: @user, status: "unpaid")
    p.save
  end
end
