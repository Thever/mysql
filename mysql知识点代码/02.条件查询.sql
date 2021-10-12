#进阶2：条件查询
/*
语法：
			select 
							查询列表
			form
							表名
			where
							筛选条件;
							
分类：
			一、按条件表达式筛选
			条件运算符：> < = != <> >= <=
			
			二、按逻辑表达式筛选
			逻辑运算符：
			作用：用于连接表达式
							&& || !
							and or not
			&&和and：两个条件为true，结果为true,反之为false
			||或or:	只要有一个条件为true,结果为true,反之为false
			!或not：如果连接的条件本身为false,结果为true,反之为false
							
			三、模糊查询
							like
							between and
							in
							is null
*/

#一、按条件表达式筛选

#案例1：查询工资>120000的员工信息
SELECT * FROM employees where salary > 12000;

#案例2：查询部门编号不等于90号的员工名和部门编号
SELECT first_name, '', last_name, department_id FROM employees WHERE department_id <> 90;

#二、按逻辑表达式筛选

#案例1：查询工资在10000到20000之间的员工名、工资和奖金
SELECT first_name, '', last_name, salary, commission_pct from employees where salary >=10000 and salary <= 20000;

#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT * FROM employees where NOT(department_id >=90 AND department_id <= 110) OR salary >15000;

#三、模糊查询
/*
	like
	特点：
	1.一般和通配符代培使用
	通配符：
	%表示任意多个字符，包含0个字符
	_表示任意单个字符，只包含1个字符
	between and
	in
	is null | is not null
*/

#1.like
#案例1：查询员工名中包含a的员工信息
SELECT * FROM employees WHERE last_name LIKE '%a%';

#案例2：查询员工名中第三个字符为n，第五个字符为l的员工名和工资
SELECT last_name, salary FROM employees WHERE last_name LIKE '__n_l%';

#案例3：查询员工名中第二个字符为_的员工名
#注意转义字符
SELECT last_name FROM employees WHERE last_name LIKE '_\_%';
#当然你也可以用escape指定转义字符
SELECT last_name FROM employees WHERE last_name LIKE '_$_%' ESCAPE '$';

#2.between and
/*
1.使用between and 可以提高语句的简介度
2.包含临界值
3.两个临界值不能交换
*/
#案例1：查询员工编号在100到120之间的员工信息
SELECT * FROM employees WHERE employee_id BETWEEN 100 and 120;

#3.in
/*
in：判断某字段的值是否属于in列表中的某一项
特点：
			1.使用in提高语句简洁度
			2.in列表的值类型必须统一或兼容
			3.不支持通配符，like才支持通配符
*/
#案例1：查询员工的工种编号是IT_PROG,AD_VP,AD_PRES中的一个员工名和工种编号
SELECT last_name FROM employees WHERE job_id in ("IT_PROG","AD_VP","AD_PRES");

#4.is null
/*
=或<>不能判断null值
is null 或 is not null 可以判断null值
*/
#案例1：查询没有奖金的员工名和奖金率
SELECT last_name, commission_pct FROM employees WHERE commission_pct IS NULL;

#案例2：查询有奖金的员工名和奖金率
SELECT last_name, commission_pct FROM employees WHERE commission_pct IS NOT NULL;

#安全等于	<=>
#案例1：查询没有奖金的员工名和奖金率
SELECT last_name, commission_pct FROM employees WHERE commission_pct <=> NULL;

#案例2：查询工资为12000的员工信息
SELECT* from employees where salary <=> 12000;

# is null pk <=>
/*
is null:仅仅可以判断null值,可读性较高，建议使用
<=>		 :既可以判断null值，又可以判断普通的数值，可读性较低
*/

#测 试
#1. 查询工资大于 12000 的员工姓名和工资
SELECT last_name, salary FROM employees where salary > 12000;

#2. 查询员工号为 176 的员工的姓名和部门号和年薪
SELECT
	last_name,
	department_id,
	salary * 12 *(1+IFNULL(commission_pct,0)) 年薪
FROM
	employees 
WHERE
	employee_id = 176;

#3. 选择工资不在 5000 到 12000 的员工的姓名和工资
SELECT last_name, salary from employees where salary < 5000 or salary > 12000;

#4. 选择在 20 或 50 号部门工作的员工姓名和部门号
SELECT last_name, department_id from employees where department_id <=> 20 or department_id <=> 50;

#5. 选择公司中没有管理者的员工姓名及 job_id
SELECT last_name, job_id FROM employees WHERE manager_id IS NULL;

#6. 选择公司中有奖金的员工姓名，工资和奖金级别
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct IS NOT NULL;

#7. 选择员工姓名的第三个字母是 a 的员工姓名
SELECT last_name FROM employees WHERE last_name LIKE '__a%';

#8. 选择姓名中有字母 a 和 e 的员工姓名
SELECT last_name FROM employees WHERE last_name LIKE '%a%e%' or last_name like '%e%a%';

#9. 显示出表 employees 表中 first_name 以 'e'结尾的员工信息
SELECT * FROM employees WHERE first_name like "%e" ;

#10. 显示出表 employees 部门编号在 80-100 之间 的姓名、职位
SELECT last_name, job_id FROM employees where department_id BETWEEN 80 and 100;

#11. 显示出表 employees 的 manager_id 是 100,101,110 的员工姓名、职位
SELECT last_name, job_id FROM employees where manager_id in (100,101,110);