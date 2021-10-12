#进阶5：分组查询
/*
语法：
			select 分组函数,列(要求出现在group by的后面)
			from 表
			[where 筛选条件]
			group by 分组的列表
			[order by 子句]
注意：
			查询列表必须特殊，要求是分组函数和group by后出现的字段
特点：
			1.分组查询中的筛选条件可以分为两类
										数据源								位置											关键字
			分组前筛选		原始表								group by字句的前面				where
			分组后筛选		分组后的结果集				group by字句的后面				having
			
			(1)分组函数做条件肯定是放在having字句中
			(2)能用分组前筛选的，就优先考虑使用分组前筛选
			
			2.group by字句支持单个字段分组，多个字段分组(多个字段之间用逗号展开没有顺序要求),表达式或函数(用的较少)
			3.也可以添加排序(排序放在整个分组查询的最后)
*/

#引入：查询每个部门的平均工资
SELECT AVG(salary) FROM employees;
SELECT AVG(salary), department_id FROM employees ORDER BY department_id;

# 简单的分组查询
#案例1：查询每个工种的最高工资
SELECT Max(salary),job_id FROM employees GROUP BY job_id; 

#案例2：查询每个位置上的部门个数
SELECT COUNT(*),location_id FROM departments GROUP BY location_id;

#添加分组前的条件
#案例1：查询邮箱中包含a字符的，每个部门的平均工资
SELECT avg(salary), department_id FROM employees WHERE email like '%a%' GROUP BY department_id;

#案例2：查询有奖金的每个领导手下员工的最高工资
SELECT Max(salary),manager_id FROM employees where commission_pct IS NOT NULL GROUP BY manager_id;

#添加分组后的筛选条件

#案例1：查询哪个部门的员工个数>2
#1.查询每个部门的员工个数
SELECT * FROM employees;
SELECT COUNT(*), department_id FROM employees GROUP BY department_id;

#2.根据结果进行筛选，查询哪个部门的员工个数>2
SELECT COUNT(*), department_id FROM employees GROUP BY department_id HAVING COUNT(*) > 2;

#案例2：查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
#1.查询每个工种有奖金的最高工资
SELECT MAX(salary), job_id FROM employees where commission_pct IS NOT NULL GROUP BY job_id;

#2.根据结果继续筛选，最高工资>12000
SELECT MAX(salary), job_id FROM employees where commission_pct IS NOT NULL GROUP BY job_id HAVING MAX(salary) > 12000;

#案例3：查询领导编号大于102的每个领导收的的最低工资>5000的领导编号以及最低工资
#1.查询领导编号大于102的最低工资分组
SELECT MIN(salary),manager_id FROM employees WHERE manager_id > 102 GROUP BY manager_id;

#2.按照上述条件进行筛选
SELECT MIN(salary),manager_id FROM employees WHERE manager_id > 102 GROUP BY manager_id HAVING MIN(salary) > 5000;

#按表达式或函数分组

#案例：按员工姓名的长度分组，查询每一组的员工个数，筛选员工个数>5的有哪些
#1.查询姓名长度的员工个数
SELECT COUNT(*), LENGTH(last_name) len_name FROM employees GROUP BY LENGTH(last_name);
#2.添加筛选条件
SELECT COUNT(*), LENGTH(last_name) len_name FROM employees GROUP BY LENGTH(last_name) HAVING COUNT(*) > 5;
#mysql筛选可以使用别名
SELECT COUNT(*) c, LENGTH(last_name) len_name FROM employees GROUP BY len_name HAVING c > 5;

#按多个字段分组

#案例：查询每个部门每个工种的员工的平均工资
SELECT AVG(salary),department_id,job_id FROM employees WHERE department_id IS NOT NULL GROUP BY department_id, job_id;

#添加排序
#案例：查询每个部门每个工种的员工的平均工资，并且按照平均工资的高低显示
SELECT AVG(salary),department_id,job_id FROM employees WHERE department_id IS NOT NULL GROUP BY department_id, job_id ORDER BY AVG(salary) DESC;

#测 试
#1. 查询各 job_id 的员工工资的最大值，最小值，平均值，总和，并按 job_id 升序
SELECT MAX(salary),MIN(salary),AVG(salary),SUM(salary) FROM employees ORDER BY job_id ASC;

#2. 查询员工最高工资和最低工资的差距（DIFFERENCE）
SELECT (MAX(salary) - MIN(salary)) DIFFERENCE FROM employees;

#3. 查询各个管理者手下员工的最低工资，其中最低工资不能低于 6000，没有管理者的员工不计算在内
SELECT * FROM employees;
SELECT MIN(salary), manager_id FROM employees WHERE manager_id IS NOT NULL GROUP BY manager_id HAVING MIN(salary) > 6000;

#4. 查询所有部门的编号，员工数量和工资平均值,并按平均工资降序
SELECT department_id, COUNT(*),AVG(salary) FROM employees GROUP BY department_id;

#5. 选择具有各个 job_id 的员工人数
SELECT COUNT(job_id), job_id FROM employees GROUP BY job_id;