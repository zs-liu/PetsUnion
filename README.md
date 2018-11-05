# PetsUnion
A Java Web Application aims to provide reservation services between pet owners and pet caring facilities

## 小组合作文档
* <a href="https://shimo.im/docs/qvsO0f5eoU0WO3Tl">需求文档</a>
* <a href="https://shimo.im/docs/cc7fd6d0e5864251">设计文档</a>

## 环境说明
- Web服务器：Apache Tomcat 9.0.12
- DBMS：MySQL 5.7
- SDK：Java SE SDK >=8.0
- IDE：IntelliJ IDEA

## 文件结构
- src/db：与数据库进行连接
- src/dao：与数据库进行交互
- src/bean：数据库表中每行对应的对象描述
- src/filter：过滤器
- src/jsp：存放Java Served Pages代码
- src/servlet：存放Servlet代码
- src/service：存放Service代码，Servlet通过Service与Dao进行交互
- src/tools：存放其他工具
- web：Web项目根目录
- web/WEB-INF/web.xml：Web项目的tomcat服务器配置文件