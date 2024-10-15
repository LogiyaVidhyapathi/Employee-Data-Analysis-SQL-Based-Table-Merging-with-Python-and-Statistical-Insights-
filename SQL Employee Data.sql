USE employeerecordsdb;

SELECT 
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    emp.email,
    emp.phone_number,
    emp.hire_date,
    emp.salary,
    emp.commission_pct,
    job.job_title,
    job.min_salary,
    job.max_salary,
    dep.department_name,
    e.first_name AS manager_name,
    MIN(jobhist.start_date) AS prev_employment_start_date,
    MAX(jobhist.end_date) AS prev_employment_end_date,
    loc.street_address,
    loc.postal_code,
    loc.city,
    loc.state_province,
    cou.country_name,
    reg.region_name
FROM
    employees emp
JOIN
	jobs job ON emp.job_id = job.job_id
LEFT JOIN
	departments dep ON emp.department_id = dep.department_id
LEFT JOIN
	employees e ON emp.manager_id = e.employee_id
LEFT JOIN
	locations loc ON dep.location_id = loc.location_id
LEFT JOIN
	countries cou ON loc.country_id = cou.country_id
LEFT JOIN
	regions reg ON cou.region_id = reg.region_id
LEFT JOIN
	job_history jobhist ON jobhist.employee_id = emp.employee_id
GROUP BY 
	emp.employee_id , emp.first_name , emp.last_name , emp.email , emp.phone_number , emp.hire_date , emp.salary , emp.commission_pct , 
	job.job_title , job.min_salary , job.max_salary , 
	dep.department_name , 
	e.employee_id , e.first_name , 
	loc.street_address , loc.postal_code , loc.city , loc.state_province , 
	cou.country_name , 
	reg.region_name;

CREATE VIEW employeeRecordsFinalView AS
SELECT 
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    emp.email,
    emp.phone_number,
    emp.hire_date,
    emp.salary,
    emp.commission_pct,
    job.job_title,
    job.min_salary,
    job.max_salary,
    dep.department_name,
    e.first_name AS manager_name,
    MIN(jobhist.start_date) AS prev_employment_start_date,
    MAX(jobhist.end_date) AS prev_employment_end_date,
    loc.street_address,
    loc.postal_code,
    loc.city,
    loc.state_province,
    cou.country_name,
    reg.region_name
FROM
    employees emp
JOIN
	jobs job ON emp.job_id = job.job_id
LEFT JOIN
	departments dep ON emp.department_id = dep.department_id
LEFT JOIN
	employees e ON emp.manager_id = e.employee_id
LEFT JOIN
	locations loc ON dep.location_id = loc.location_id
LEFT JOIN
	countries cou ON loc.country_id = cou.country_id
LEFT JOIN
	regions reg ON cou.region_id = reg.region_id
LEFT JOIN
	job_history jobhist ON jobhist.employee_id = emp.employee_id
GROUP BY 
	emp.employee_id , emp.first_name , emp.last_name , emp.email , emp.phone_number , emp.hire_date , emp.salary , emp.commission_pct , 
	job.job_title , job.min_salary , job.max_salary , 
	dep.department_name , 
	e.employee_id , e.first_name , 
	loc.street_address , loc.postal_code , loc.city , loc.state_province , 
	cou.country_name , 
	reg.region_name;