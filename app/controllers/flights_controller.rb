class FlightsController < ApplicationController
  
  def index
    @flights = Flight.all
    ConfirmationMailer.confirmation().deliver
    logger.info("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")#Ausgabe in Log-Datei
    #TODO: debugging
    # debugger
  end
  
  def show
    @flight = Flight.find(params[:id])
  end
  
end
