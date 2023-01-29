--Все пассажиры, которые летали из Москвы(VKO, DME, SVO) в Ульяновск
SELECT t.passenger_id, t.passenger_name, f.departure_airport, f.arrival_airport
FROM tickets t, ticket_flights tf, flights f
WHERE t.ticket_no = tf.ticket_no AND tf.flight_id = f.flight_id
AND f.departure_airport IN ('VKO', 'SVO', 'DME') AND f.arrival_airport = 'ULV'

--Тоже самое, но через JOIN
SELECT t.passenger_id, t.passenger_name, f.departure_airport, f.arrival_airport
FROM tickets t JOIN
ticket_flights tf USING (ticket_no)
JOIN flights f USING (flight_id)
WHERE f.departure_airport IN ('VKO', 'SVO', 'DME') AND f.arrival_airport = 'ULV'

--Аэропорт, в который в 2017 с мая июль по чаще всего прилетали
SELECT ap.airport_code, COUNT(f.arrival_airport)
FROM airports_data ap JOIN flights f ON ap.airport_code = f.arrival_airport
WHERE f.scheduled_arrival >= '2017-05-01 00:00:00+04' AND f.scheduled_arrival < '2017-08-01 00:00:00+04'
GROUP BY ap.airport_code
ORDER BY 2 DESC
LIMIT 1

--Откуда летал чаще всего самолет, с наибольшим числом мест
SELECT f.departure_airport, COUNT(*)
FROM flights f, aircrafts_data ac
WHERE ac.aircraft_code = (SELECT ac1.aircraft_code 
          FROM seats, aircrafts_data ac1
          GROUP BY ac1.aircraft_code
          ORDER BY COUNT(*)
          LIMIT 1)
GROUP BY f.departure_airport
ORDER BY 2
LIMIT 1

--Пассажиры, имена которых начинаются на VL, а фамилии заканчиваются на OV
SELECT t.passenger_id, t.passenger_name
FROM tickets t
WHERE t.passenger_name LIKE 'VL% %OV'