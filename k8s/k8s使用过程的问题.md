## 问题

### 问题1
问题表述： 创建kubectl create -f mysql-rc.yaml的时候出现错误  
 
```
error: error validating "mysql-rc.yaml": error validating data: the server could not find the requested resource; if you choose to ignore these errors, turn validation off with --validate=false

``` 
原因： 默认连接的server 是http://localhost:8080，由于改了端口号需指定server 

和问题2一样原因造成的，问题2解决后，问题解决


### 问题2
问题描述： 通过命令kubectl version获取kubectl版本信息  

```
Client Version: version.Info{Major:"1", Minor:"5", GitVersion:"v1.5.2", GitCommit:"269f928217957e7126dc87e6adfa82242bfe5b1e", GitTreeState:"clean", BuildDate:"2017-07-03T15:31:10Z", GoVersion:"go1.7.4", Compiler:"gc", Platform:"linux/amd64"}
Error from server (NotFound): the server could not find the requested resource

```



原因： 默认连接的server 是http://localhost:8080，由于改了端口号需指定server  


修改连接端口：  

```
alias kubectl=" kubectl -s http://localhost:8088"
```

状态： 解决