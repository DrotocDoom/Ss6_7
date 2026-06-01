

CREATE TABLE department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department_id INT,
    salary NUMERIC(10,2),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

SELECT e.id, e.full_name, d.name department_name, e.salary FROM employee e
INNER JOIN department d on e.department_id = d.id;

SELECT d.name department_name, avg(e.salary) avg_salary FROM employee e
INNER JOIN department d on e.department_id = d.id
GROUP BY d.id, d.name
HAVING avg(e.salary) > 10000000;

SELECT
    d.id,
    d.name AS department_name
FROM Department d
         LEFT JOIN Employee e
                   ON d.id = e.department_id
WHERE e.id IS NULL;