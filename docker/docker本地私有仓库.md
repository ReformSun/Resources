## 使用registry创建和启动本地私有仓库

```
docker run -d -p 5000:5000 registry:2
或者
docker run -d -p 5000:5000 -v /opt/data/registry:/var/lib/registry registry:2
或者
docker run -d -p 5000:5000 restart=always --name registry registry:2
```

## 配置参数配置文件和仓库存储路径

默认的配置文件存储路径为：/etc/docker/registry/config.yml

## 管理私有仓库

### 根据已有的镜像创建新的镜像添加标签
```
docker images
docker tag tomcat:latest 172.31.35.61:5000/test

```
### push 添加标签的镜像到私有仓库中

```
docker push 172.31.35.61:5000/test

```

### 查看本地仓库的镜像

```
// 查看私有仓库列表
curl -X GET http://127.0.0.1:5000/v2/_catalog
curl -X GET http://127.0.0.1:5000/v2/test/tags/list



```


## pull 私有仓库的镜像到本地

```
# 首先删除上面创建的TAG镜像与Docker官方的Tomcat镜像，因为本地不存在对应镜像层时Docker才会从私有仓库下载镜像
# docker rmi tomcat
# docker rmi 127.0.0.1:5000/clay-tomcat:1.0

# 将私有仓库中的镜像Pull到本地，clay-tomcat是私有仓库的名称，1.0是私有仓库中镜像的版本号（默认为latest）
# docker pull 127.0.0.1:5000/clay-tomcat:1.0

# 使用刚Pull下来的Tomcat镜像，创建并启动Tomcat容器，可以通过浏览器测试访问Tomcat页面：http://127.0.0.1:8080/
# docker run -d --name tomcat -p 8080:8080 127.0.0.1:5000/clay-tomcat:1.0

```


## 删除私有仓库内的镜像

```
# Docker官方推荐使用digest_hash参数删除私有仓库中的镜像数据，具体教程请自行网上搜索。

# 连接Registry容器，docker-registry是容器名称，也可以使用容器ID
# docker exec -it docker-registry /bin/sh

# 删除对应镜像的所有版本，其中clay-tomcat是镜像名称
# rm -rf /var/lib/registry/docker/registry/v2/repositories/clay-tomcat

# 执行垃圾回收操作，注意2.4版本以上的registry才有此功能
# docker exec registry bin/registry garbage-collect /etc/docker/registry/config.yml

# 删除后需要重启Registry容器
# docker restart docker-registry

# 查看私有仓库列表
# curl -X GET http://127.0.0.1:5000/v2/_catalog
{"repositories":[]}
```


### 登陆远程私有仓库

```
docker login 172.31.35.61:5000

```


## 引用

[私有仓库的操作](https://www.techgrow.cn/posts/c76f5f00.html)