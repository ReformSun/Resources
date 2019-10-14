## maven的基本使用
### 常用命令
* archetype:create 已经过时不在使用
* archetype:generate 从模板创建一个maven项目
* archetype:create-from-project 从一个项目中创建模板
* archetype:crawl 在一个指定的Maven库中查找可以的模板，并更新模板目录

### 创建archetype原型
1. 在项目的根目录下执行  
mvn archetype:create-from-project  

2. 进入 cd target/generated-sources/archetype 目录下  
3. 执行 mvn install 命令  
这时会在/Users/apple/.m2/repository 也就是maven的本地仓库的根目录生成一个archetype-catalog.xml文件，这时可以通过模型创建项目了  
4. 执行命令 mvn archetype:generate -DarchetypeCatalog=local  
从本地Catalog创建项目











### 引用资源
[maven中archetype(原型)的使用及创建](https://blog.csdn.net/bawcwchen/article/details/80298173)  
[Apache Maven项目提供的Archetype插件详解](https://blog.csdn.net/taiyangdao/article/details/51249367)