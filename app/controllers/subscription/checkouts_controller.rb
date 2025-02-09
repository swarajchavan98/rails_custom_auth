class Subscription::CheckoutsController < ApplicationController
  before_action :require_authentication
  layout "payments", only: [ :new ]

  def show
  end

  def new
    @order = Razorpay::Order.create amount: 5000, currency: "INR"
  end

  def create
  end
end
