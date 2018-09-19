1.安装MySQL Server 5.0 数据库
2.进入MySQL Server 5.0 控制台
3.通过命令‘create database argorse;’创建名为argorse的数据库
4.通过‘use argorse;’命令进入argorse数据库，执行命令'source D:\argorse.sql'(假设argorse.sql文件放在D盘根目录)
5.将arogrse.war文件夹拷贝到tomcat中的webapps文件夹下
6.启动tomcat
7.通过'http://localhost:8080/argorse'访问网站前台(假设服务部署在本地，tomcat端口为8080)
8.通过'http://localhost:8080/argorse/login.html'访问网站后台(假设服务部署在本地，tomcat端口为8080)