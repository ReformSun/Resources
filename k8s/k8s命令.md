## k8s的相关命令

### kubectl 模块相关的命令
```
kubectl get nodes
kubectl version
```

### 发布rc到kubernetes
```
kubectl create -f mysql-rc.yaml
// 使用命令查看刚才创建的rc
kubectl get rc

// 查看pod的运行情况
kubectl get pods
```

### 修改rc的副本数
可实现pod的动态伸缩
```
kubectl scale rc mysql1 --replicas=3

```

### 删除资源对象

```
kubectl delete -f mysql-rc.yaml --cascade=false

```

### 查看资源详情

```
kubectl describe mysql
```