CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    phone_number varchar(20) NOT NULL
);

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    production_year integer,
    license_plate varchar(10) NOT NULL,
    brand varchar(20) NOT NULL,
    client_id integer REFERENCES clients
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    issue_date date NOT NULL,
    price numeric NOT NULL,
    type text NOT NULL,
    scheduled_end_date date NOT NULL,
    actual_end_date date NOT NULL,
    car_id integer REFERENCES cars
);

CREATE TABLE mechanics (
    mechanic_id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    experience integer,
    degree integer NOT NULL,
    number varchar(15) NOT NULL,
    actual_salary numeric NOT NULL,
    previous_salaries numeric[]
);

CREATE TABLE lists (
    list_id SERIAL PRIMARY KEY,
    order_id integer REFERENCES orders,
    mechanic_id integer REFERENCES mechanics
);

CREATE TABLE details (
    detail_id SERIAL PRIMARY KEY,
    name text NOT NULL,
    params jsonb NOT NULL,
    order_id integer REFERENCES orders
);
