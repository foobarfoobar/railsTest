class FlightsController < ApplicationController
  
  def index
    @flights = Flight.all
    ConfirmationMailer.confirmation().deliver
  end
  
  def show
    @flight = Flight.find(params[:id])
  end
  
end
