#标识列
/*
又称为自增长列
含义：可以不用手动的插入值，系统提供默认的序列值


特点：
1、标识列必须和主键搭配吗？不一定，但要求是一个key(主键,唯一,外键)
2、一个表可以有几个标识列？至多一个！
3、标识列的类型只能是数值型
4、标识列可以通过 SET auto_increment_increment=3;设置步长
可以通过 手动插入值，设置起始值


*/

#一、创建表时设置标识列


DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity(
	id INT  ,
	NAME FLOAT UNIQUE AUTO_INCREMENT,
	seat INT 
);
TRUNCATE TABLE tab_identity;

# 注意类型
INSERT INTO tab_identity(id,NAME) VALUES(NULL,'john');
INSERT INTO tab_identity(NAME) VALUES('lucy');

# 添加数据
INSERT INTO tab_identity(id,seat) VALUES(1,1);
SELECT * FROM tab_identity;


# 查看自增长参数
SHOW VARIABLES LIKE '%auto_increment%';
# 设置增加步长
SET auto_increment_increment=3;
# 设置起始值，mysql不支持
SET auto_increment_offset=3;

#二、修改表时设置标识列
ALTER TABLE tab_identity MODIFY COLUMN id INT AUTO_INCREMENT;

#三、修改表时删除标识列
ALTER TABLE tab_identity MODIFY COLUMN id INT;

