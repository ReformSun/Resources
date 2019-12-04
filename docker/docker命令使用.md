## 下载tomcat镜像

```
// 查找tomcat容器
sudo docker search tomcat
// 下载tomcat镜像
sudo docker pull tomcat
```

## 创建tomcat容器

```
docker run -d -p 8083:8080 -v /yundata/docker-data/webapps/myapps/mytomcat/:/usr/local/tomcat/webapps/mytomcat/  tomcat
```

## 查看tomcat容器运行状况

```
docker ps
```


## 进入tomcat容器执行bash操作

```
docker exec -it 76a05b978345  /bin/bash

```


## 退出tomcat容器

```
exit
```


## 引用

[tomcat](https://blog.csdn.net/weixin_39381833/article/details/88311763)