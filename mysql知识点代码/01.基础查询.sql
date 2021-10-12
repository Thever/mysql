#进阶1：基础查询
/*
语法：select 查询列表 from 表名;
特点：
1、查询列表可以是：表中的字段、常量值、表达式、函数
2、查询的结果是一个虚拟的表格
*/
#	启用对应的库
use myemployees;

#1.查询单个字段
SELECT last_name FROM employees;

#2.查询表中的多个字段
SELECT last_name, salary, email FROM employees;

#3.查询表中的所有字段
# 方式一：自己罗列排序
SELECT
	employee_id,
	first_name,
	last_name,
	email,
	phone_number,
	job_id,
	salary,
	commission_pct,
	manager_id,
	department_id,
	hiredate 
FROM
	employees;

# 方式二：使用默认顺序
SELECT * FROM employees;

# 关于是否使用着重号``,一般是用来标识特定的字段，比如name,在sql中可能是特定字段，用着重号标识可以标识字段名称
SELECT `name` FROM xxx;

#4.查询常量值
SELECT 100;
SELECT "john";

#5.查询表达式
SELECT 100*98;
SELECT 100%98;

#6.查询函数
SELECT VERSION();

#7.起别名
/*
1.便于理解
2.如果要查询的字段有重名的情况，使用别名可以区分开来
*/
# 方式一：使用as
SELECT 100%98 AS 结果;
SELECT last_name as 姓, first_name as 名 FROM employees;

# 方式二：使用空格
SELECT last_name 姓, first_name 名 FROM employees;

# 案例：查询salary,显示结果为 out put
SELECT salary as "out put" from employees;

#8.去重

#案例：查询员工表中涉及到的所有的部门编号
#DISTINCT:去重
SELECT DISTINCT department_id FROM employees;

#9.+号的作用
/*
java中的+号：
1.运算符，两个操作数都为数值型
2.连接符，只要有一个操作数为字符串

mysql中的+号：
仅仅只有一个功能：运算符
select 100+90; 两个操作数都为数值型，则做加法运算
select '123'+90; 只要其中一方为字符型，试图将字符型数值转换成数值型
					如果转换成功，则继续做加法运算
select 'john'+90;			如果转换失败，则将字符型数值转换成0
select null+10;				只要其中一方为null，则结果肯定为null;
*/
#案例：查询员工名和姓连接成一个字段，并显示为姓名
/*
SELECT
	last_name + first_name AS 姓名 
FROM
	employees；
*/

#通过CONCAT函数来拼接内容
SELECT
	CONCAT( last_name, ' ',first_name ) AS 姓名 
FROM
	employees;
	
# 测试
#1.	下面的语句是否可以执行成功  
SELECT last_name , job_id , salary AS sal
FROM employees; 
# 可以

#2.下面的语句是否可以执行成功  
SELECT  *  FROM employees; 
# 可以

#3.找出下面语句中的错误 
SELECT employee_id, last_name,
salary * 12 AS "ANNUAL  SALARY"
FROM employees;
# 逗号，双引号注意在英文状态下输入


#4.显示表departments的结构，并查询其中的全部数据
DESC departments;
SELECT * FROM `departments`;

#5.显示出表employees中的全部job_id（不能重复）
SELECT DISTINCT job_id FROM employees;

#6.显示出表employees的全部列，各个列之间用逗号连接，列头显示成OUT_PUT

SELECT
	# IFNULL判断是否为空， IFNULL(列名,如果为null返回的值)
	IFNULL(commission_pct,0) AS 奖金率,
	commission_pct
FROM 
	employees;
	
	
#-------------------------------------------

SELECT
	CONCAT(`first_name`,',',`last_name`,',',`job_id`,',',IFNULL(commission_pct,0)) AS out_put
FROM
	employees;