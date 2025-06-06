SELECT * FROM flights f2
WHERE flight_no < (SELECT MAX(flight_no)FROM flights f1
  				   WHERE f1.departure_airport=f2.departure_airport)


CREATE INDEX flight_no_index
ON flights
(departure_airport,flight_no)