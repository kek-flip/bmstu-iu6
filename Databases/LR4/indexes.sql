CREATE INDEX issue_date ON orders(issue_date);

EXPLAIN ANALYZE
--Заказы, которые длились меньше 13ти дней и были выполнены в срок
SELECT orders.order_id, orders.issue_date, orders.actual_end_date, orders.type
FROM orders
WHERE orders.actual_end_date - orders.issue_date < 13 AND orders.actual_end_date = orders.scheduled_end_date
ORDER BY 2;

--==========================================

CREATE INDEX clients_name ON clients(name);

EXPLAIN ANALYZE
SELECT clients.name, cars.license_plate, cars.brand
FROM clients JOIN cars USING(client_id)
WHERE clients.name IN (SELECT clients.name
                      FROM clients JOIN cars USING(client_id)
                      GROUP BY clients.client_id
                      HAVING COUNT(cars.car_id) > 1)
ORDER BY clients.name;