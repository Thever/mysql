//  引入依赖
let mysql = require('mysql')

//  创建链接
let connection = mysql.createConnection({     
    host     : 'localhost',       
    user     : 'root',              
    password : '123456',       
    // port: '3306', // 默认端口号3306可以不写                  
    database: 'laochen' 
}) 

//  连接
connection.connect((err) => {
    //  如果建立链接失败
    if(err){
        console.log(err)
    }else{
        console.log('数据库连接成功')
    }
})

// //  查询语句
// let sql = 'select * from student';

// //  执行语句查询
// connection.query(sql, (err, result, fields) => {
//     if(err){
//         console.log('[SELECT ERROR] - ',err.message);
//         return;
//     }

//     console.log('------SELECT------');
//     console.log(result);
//     // console.log(fields);
//     console.log('------------------');  
// });

// //  删除表语句
// let sql2 = 'drop table student'

// //  删除表
// connection.query(sql2, (err, result, fields) => {
//     if(err){
//         console.log('[SELECT ERROR] - ',err.message);
//         return;
//     }

//     console.log('------SELECT------');
//     console.log(result);
//     // console.log(fields);
//     console.log('------------------');  
// });

// //  删除库语句
// let sql3 = 'drop database laochen'

// //  删除库,注意删除了链接数据库里的目标数据库，要把对应的字段注释掉
// connection.query(sql3, (err, result, fields) => {
//     if(err){
//         console.log('[SELECT ERROR] - ',err.message);
//         return;
//     }

//     console.log('------SELECT------');
//     console.log(result);
//     // console.log(fields);
//     console.log('------------------');  
// });

// //  创建库语句
// let sql4 = 'create database laochen'

// //  创建库
// connection.query(sql4, (err, result, fields) => {
//     if(err){
//         console.log('[SELECT ERROR] - ',err.message);
//         return;
//     }

//     console.log('------SELECT------');
//     console.log(result);
//     // console.log(fields);
//     console.log('------------------');  
// });

// //  创建表语句
// //  注意不要使用反引号，直接用单引号包裹 navicat 里面的SQL 
// let sql5 = 'CREATE TABLE `user`  (`id` int NOT NULL AUTO_INCREMENT,`username` varchar(255) NULL,`password` varchar(255) NULL,`mail` varchar(255) NULL,PRIMARY KEY (`id`));'

// //  删除库
// connection.query(sql5, (err, result, fields) => {
//     if(err){
//         console.log('[SELECT ERROR] - ',err.message);
//         return;
//     }

//     console.log('------SELECT------');
//     console.log(result);
//     // console.log(fields);
//     console.log('------------------');  
// });

// //  插入数据
// let sql6 = 'insert into user (id, username,password,mail) values (1,"TheverWang","123456","574770209@qq.com")'

// //  插入数据
// connection.query(sql6, (err, result, fields) => {
//     if(err){
//         console.log('[SELECT ERROR] - ',err.message);
//         return;
//     }

//     console.log('------SELECT------');
//     console.log(result);
//     // console.log(fields);
//     console.log('------------------');  
// });

// //  插入数据,由于id是自增的，可以不填
// let sql7 = 'insert into user (username,password,mail) values ("TheverWang2","123456","574770209@qq.com")'

// //  插入数据
// connection.query(sql7, (err, result, fields) => {
//     if(err){
//         console.log('[SELECT ERROR] - ',err.message);
//         return;
//     }

//     console.log('------SELECT------');
//     console.log(result);
//     // console.log(fields);
//     console.log('------------------');  
// });

// //  使用占位符来插入数据，用于获取前端传入数据
// let sql8 = 'insert into user (username,password,mail) values (?,?,?)'

// //  插入数据
// connection.query(sql8, ['子安武人','123456','laomao@qq.com'],(err, result, fields) => {
//     if(err){
//         console.log('[SELECT ERROR] - ',err.message);
//         return;
//     }

//     console.log('------SELECT------');
//     console.log(result);
//     // console.log(fields);
//     console.log('------------------');  
// });

//  更新数据
let sql9 = 'update user SET username = ?,password = ?,mail = ? where id=2'
let update = ['子安武人','111111','dio@dio.com']
//  插入数据
connection.query(sql9, update,(err, result, fields) => {
    if(err){
        console.log('[SELECT ERROR] - ',err.message);
        return;
    }

    console.log('------SELECT------');
    console.log(result);
    // console.log(fields);
    console.log('------------------');  
});

//  断开链接
connection.end();