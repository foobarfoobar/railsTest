# encoding: utf-8

Gegebensei(/^ein Flug "([^"]*)"$/) do |nr|
  Flight.create(nr: nr)
end

Wenn(/^ich den Flug "([^"]*)" auswaehle$/) do |flight_nr|
  visit flights_path
  # save_and_open_page # speichert eine html-Seite
  click_link flight_nr # DSL Capybara
  page.should have_content("Booking of #{flight_nr}")
end

Wenn(/^ich meine Personalien eingebe$/) do
  fill_in "Name", with: "Foo Bar"
  fill_in "Email", with: "foo@bar.net" #fill_in: Capybara-Methode
end

Wenn(/^ich bezahle$/) do
  click_button "pay"
end

Dann(/^soll ich eine Buchungsbestaetigung für den Flug "([^"]*)" erhalten$/) do |nr|
  page.should have_content("Your booking confirmation")
  flight = Flight.find_by_nr(nr)
  flight.should have(1).bookings
  booking = flight.bookings.first
  booking.name.should be == "Foo Bar"
  booking.email.should be == "foo@bar.net"
end

Wenn(/^ich meine Personalien nicht eingebe$/) do
end

Dann(/^soll mir eine Fehlermeldung angezeigt werden$/) do
  page.should_not have_content("Your booking confirmation")#wird nicht angezeigt, weil nicht zur
                    #Bestaetigungsseite weitergeleitet wird, sondern zur Form. zur Eingabe der Personalien
  page.should have_content("Booking of RA-448")#das sollte auf der Seite sein
  page.should have_content("Name can't be blank")#Fehlermeldung
  page.should have_content("Email can't be blank")#Fehlermeldung
end

Gegebensei(/^ein Flug RA\-(\d+) von DUS nah LUX mit (\d+) freien Plätzen$/) do |nr, anz|
  flight = Flight.create(nr: nr, free_seats: anz)
end

Wenn(/^ich den Flug RA\-(\d+) auswähle$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Dann(/^soll mir angezeigt werden, dass der Flug ausgebucht ist$/) do
  pending # Write code here that turns the phrase above into concrete actions
end