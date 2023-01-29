CREATE OR REPLACE FUNCTION raise_salary() RETURNS void AS $$
    UPDATE mechanics SET salary = (SELECT AVG(salary) FROM mechanics) WHERE salary < (SELECT AVG(salary) FROM mechanics)
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fib(a integer) RETURNS integer AS $$
DECLARE
    f1 integer = 1;
    f2 integer = 1;
    tmp integer = 0;
BEGIN
    while TRUE loop
        if (f2 > a) then
            return f2;
        end if;
        tmp = f2;
        f2 = f2 + f1;
        f1 = tmp;
    end loop;
END
$$ LANGUAGE plpgsql;
