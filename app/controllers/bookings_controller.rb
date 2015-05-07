class BookingsController < ApplicationController
  
  def index
    @booking = Booking.all
  end
  
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
  end
  
  def create
    # kein eigenes Template (view) noetig; hier wird ueberprueft, ob Objekt mit den Attributen, die ueber dass 
    # Formular gesendet werden, gespeichert werden kann; ja: Weiterleitung zu anderer Seite, nein: Formular wird
    # wieder angezeigt
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.create(params[:booking]) # Buchung gehoert zu einem Flug, 
    # deswegen so statt Booking.create(params..)
    if @booking.save
      redirect_to [@flight, @booking]
    else
      render action: :new #Eingabeformular neu laden
    end
  end
  
end
