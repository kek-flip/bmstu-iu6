--Клиенты, у которых более одной машины
SELECT clients.name, cars.license_plate, cars.brand
FROM clients JOIN cars USING(client_id)
WHERE clients.name IN (SELECT clients.name
                      FROM clients JOIN cars USING(client_id)
                      GROUP BY clients.client_id
                      HAVING COUNT(cars.car_id) > 1)
ORDER BY clients.name

--Заказы, которые длились меньше 13ти дней и были выполнены в срок
SELECT orders.order_id, orders.issue_date, orders.actual_end_date, orders.type
FROM orders
WHERE orders.actual_end_date - orders.issue_date < 13 AND orders.actual_end_date = orders.scheduled_end_date

--Кол-во заказов у каждого механика
SELECT m.name, COUNT(l.order_id) "Кол-во заказов"
FROM mechanics m, lists l
WHERE m.mechanic_id = l.mechanic_id
GROUP BY m.mechanic_id
ORDER BY 2

--Машины, которые ремонтируются в данный момент
SELECT c.license_plate, c.brand, o.scheduled_end_date
FROM cars c JOIN orders o USING(car_id)
WHERE o.scheduled_end_date > CURRENT_DATE
ORDER BY o.scheduled_end_date

--===================================================
--Повышение минимально зарплаты механиков до средней
UPDATE mechanics SET salary = (SELECT AVG(salary) FROM mechanics) WHERE salary < (SELECT AVG(salary) FROM mechanics)

--Решили не ремонтировать хонды
DELETE FROM orders WHERE car_id IN (SELECT car_id FROM cars WHERE brand = 'Honda');
DELETE FROM cars WHERE brand = 'Honda';
--Ошибка целостности
--ERROR: ОШИБКА:  UPDATE или DELETE в таблице "orders" нарушает ограничение внешнего ключа "lists_order_id_fkey" таблицы "lists"
--DETAIL:  На ключ (order_id)=(5) всё ещё есть ссылки в таблице "lists".

--Решили уволить механиков со вторым разрядом
DELETE FROM lists WHERE mechanic_id IN (SELECT mechanic_id FROM mechanics WHERE degree = 2);
DELETE FROM mechanics WHERE degree = 2;

--===================================================
--Триггер
CREATE FUNCTION check_mechanic_salary()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.salary < 0 THEN
        RAISE EXCEPTION 'Mechanic salary must be positive';
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER check_salary
BEFORE INSERT OR UPDATE ON mechanics
FOR EACH ROW
EXECUTE FUNCTION check_mechanic_salary();