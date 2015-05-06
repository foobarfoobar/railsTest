class BookingsController < ApplicationController
  
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
  
  private
  #Rails 4: the needed parameters must be marked as required
  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def booking_params
    params.require(:booking).permit(:name, :email, :flight_id) # fuer Rails4!!
  end
  
end
