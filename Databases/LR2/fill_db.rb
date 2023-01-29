require 'faker'

f = File.open('fill db.sql', 'w')
f.write("\\connect carservice;\n\n")

# Filling owners
clients_amount = 100
f.write("--Clients data (#{clients_amount} records)\n\n")
clients_amount.times do
  f.write("INSERT INTO clients(name, phone_number) VALUES (\'#{Faker::Name.name.sub(/\'/, "\\\'")}\', \'#{Faker::PhoneNumber.cell_phone_in_e164}\');\n")
end
f.write("\n")

# Filling mechanics
mechanics_amount = 20
f.write("--Mechanics data(#{mechanics_amount} records)\n\n")
mechanics_amount.times do
  f.write("INSERT INTO mechanics(name, experience, degree, number, salary) 
  VALUES (
    \'#{Faker::Name.name.sub(/\'/, "\\\'")}\', 
    #{rand(1..20)}, 
    #{rand(2..6)}, 
    #{Faker::Alphanumeric.alphanumeric(number: 10, min_numeric: 10)},
    #{rand(20_000..50_000)});\n")
end
f.write("\n")

# Filling cars
cars_amount = 150
f.write("--Cars data (#{cars_amount} records)\n\n")
1.upto(clients_amount) do |i|
  f.write("INSERT INTO cars(production_year, license_plate, brand, client_id) 
  VALUES (
    #{rand(1990..2022)},
    \'#{Faker::Vehicle.license_plate}\',
    \'#{Faker::Vehicle.make}\',
    #{i}
  );\n")
end
(cars_amount - clients_amount).times do
  f.write("INSERT INTO cars(production_year, license_plate, brand, client_id) 
  VALUES (
    #{rand(1990..2022)},
    \'#{Faker::Vehicle.license_plate}\',
    \'#{Faker::Vehicle.make}\',
    #{rand(1..clients_amount)}
  );\n")
end
f.write("\n")

# Filling orders
orders_amount = 1000
f.write("--Orders data (#{orders_amount} records)\n\n")
orders_that_went_wrong = 50
(orders_amount - orders_that_went_wrong).times do
  issue_date = Faker::Date.between(from: '2003-09-15', to: '2022-11-13')
  end_date = Faker::Date.between(from: issue_date.to_s, to: '2023-01-17')
  f.write("INSERT INTO orders(issue_date, price, type, scheduled_end_date, actual_end_date, car_id) 
  VALUES (
    \'#{issue_date.to_s}\',
    #{rand(1000..100_000)},
    \'#{Faker::Lorem.sentence}\',
    \'#{end_date.to_s}\',
    \'#{end_date.to_s}\',
    #{rand(1..cars_amount)}
  );\n")
end
orders_that_went_wrong.times do
  issue_date = Faker::Date.between(from: '2003-09-15', to: '2022-11-13')
  scheduled_end_date = Faker::Date.between(from: issue_date.to_s, to: '2023-01-17')
  actual_end_date = Faker::Date.between(from: scheduled_end_date.to_s, to: '2023-03-20')
  f.write("INSERT INTO orders(issue_date, price, type, scheduled_end_date, actual_end_date, car_id) 
  VALUES (
    \'#{issue_date.to_s}\',
    #{rand(1000..100_000)},
    \'#{Faker::Lorem.sentence}\',
    \'#{scheduled_end_date.to_s}\',
    \'#{actual_end_date.to_s}\',
    #{rand(1..cars_amount)}
  );\n")
end

# Filling lists
lists_amount = 500
f.write("--Lists data (#{lists_amount} records)\n\n")
lists_amount.times do
  f.write("INSERT INTO lists(order_id, mechanic_id) 
  VALUES (
    #{rand(1..orders_amount)},
    #{rand(1..mechanics_amount)}
  );\n")
end
