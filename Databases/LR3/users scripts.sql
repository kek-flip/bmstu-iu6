create user test;
GRANT SELECT, INSERT, UPDATE ON TABLE details TO test;
GRANT SELECT(production_year, brand), UPDATE(production_year, brand) ON TABLE cars TO test;
GRANT SELECT ON TABLE orders TO test;

CREATE VIEW orders_per_mechanic AS
    SELECT mechanics.name, COUNT(order_id) AS "Кол-во заказов"
    FROM mechanics, lists, orders
    WHERE lists.mechanic_id = mechanics.mechanic_id AND lists.order_id = orders.order_id
    GROUP BY mechanics.name;

CREATE VIEW clients_cars AS
    SELECT clients.name AS name, cars.license_plate AS "license plate"
    FROM clients, cars
    WHERE cars.client_id = clients.client_id
    ORDER BY 1;

CREATE ROLE update_test;
GRANT UPDATE(name) ON TABLE clients TO update_test;
GRANT update_test TO test;