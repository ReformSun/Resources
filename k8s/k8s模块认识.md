## 模块学习

### etcd


### docker
运行在Node节点上
Docker引擎，负责本机的容器创建和管理工作

### kube-apiserver 
运行在master节点上
提供http restful接口，可以实现对kubernetes资源的增、删、改、查等操作


### kube-controller-manager
运行在master节点上
所有资源对象的自动化控制中心


### kube-scheduler
运行在master节点上
负责资源调度（Pod调度），相当于公交公司的调度室

### kubelet
运行在Node节点上
负责Pod对应的容器的创建，启停等任务，同时与master接地那密切协同，实现集群管理的基本功能


### kube-proxy
运行在Node节点上
实现kubernetes Service的通信与负载均衡机制的重要组件