#进阶3：排序查询

/*
引入

		select * FROM employees;

语法：
		
		select 查询列表
		from 表
		[where 筛选条件]
		order by 排序列表 [asc升序,默认升序|desc降序]
		
特点：
		1.asc代表的是升序，desc代表的是降序，不写默认的是升序。
		2.order by字句中可以支持单个字段，多个字段，表达式，函数，别名。
		3.order by字句一般是放在查询语句的最后面，limit字句除外。 
*/

#案例1： 查询员工信息，要求工资从高到低排序
SELECT * FROM employees ORDER BY salary DESC;

#案例2：查询部门编号>=90的员工信息，按入职时间先后来排序
SELECT * FROM employees WHERE department_id >= 90 ORDER BY hiredate;

#案例3：按年薪的高低显示员工的信息和年薪[按表达式排序]
SELECT
	*,
	salary * 12 *(1+IFNULL(commission_pct,0)) 年薪
FROM
	employees 
ORDER BY
	salary * 12 *(1+IFNULL(commission_pct,0)) DESC;

#案例4：按年薪的高低显示员工的信息和年薪[按别名排序]
SELECT
	*,
	salary * 12 *(1+IFNULL(commission_pct,0)) 年薪
FROM
	employees 
ORDER BY
	年薪 DESC;
	
#案例5：按姓名的长度显示员工的姓名和工资[按函数排序]
SELECT
	LENGTH( last_name ) 字节长度,
	last_name,
	salary 
FROM
	employees 
ORDER BY
	LENGTH( last_name ) DESC;
	
#案例6：查询员工信息，要求先按工资升序，再按员工编号降序[按多个字段排序]
SELECT
	* 
FROM
	employees 
ORDER BY
	salary ASC,
	employee_id DESC;
	
#测 试
#1. 查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序
SELECT last_name, department_id FROM employees ORDER BY salary * 12 *(1+IFNULL(commission_pct,0)) DESC, last_name ASC;

#2. 选择工资不在 8000 到 17000 的员工的姓名和工资，按工资降序
SELECT last_name, salary FROM employees WHERE salary < 8000 or salary > 170000 ORDER BY salary DESC;

#3. 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序
SELECT * FROM employees where email like '%e%' ORDER BY LENGTH(email) DESC, department_id ASC; 