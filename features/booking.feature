# language: de
Funktionalität: Buchung eines Railsair Fluges
  Als Passagier soll es moeglich sein, einen Flug auf der 
  Website der Fluggesellschaft Railsair zu buchen.
  
  Szenario: Erfolgreich einen Flug buchen
    Gegeben sei ein Flug "RA-448"
    Wenn ich den Flug "RA-448" auswaehle
    Und ich meine Personalien eingebe
    Und ich bezahle
    Dann soll ich eine Buchungsbestaetigung für den Flug "RA-448" erhalten

  Szenario: Bei Fehleingabe soll die Buchung nicht ausgeführt werden
    Gegeben sei ein Flug "RA-448"
    Wenn ich den Flug "RA-448" auswaehle
    Und ich meine Personalien nicht eingebe
    Und ich bezahle
    Dann soll mir eine Fehlermeldung angezeigt werden
    
  Szenario: Das Buchen eines ausgebuchten Fluges soll nicht möglich sein
    Gegeben sei ein Flug RA-448 von DUS nah LUX mit 0 freien Plätzen
    Wenn ich den Flug RA-448 auswähle
    Dann soll mir angezeigt werden, dass der Flug ausgebucht ist