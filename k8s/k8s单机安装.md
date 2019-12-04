## 关闭防火墙
// 查看防火墙状态  
systemctl status firewalld  
// 如果没有安装  
yum install firewalld
// 开启防火墙  
systemctl start firewalld.service  
// 关闭防火墙
systemctl stop firewalld.service  

systemctl disable firewalld  
systemctl stop firewalld 
或者 
service iptables stop  
firewall-cmd —zone=public —add-port=2181/tcp —permanent  
firewall-cmd —zone=public —add-port=2888/tcp —permanent  
firewall-cmd —zone=public —add-port=50070/tcp —permanent  
firewall-cmd —reload  

## 安装
yum install -y etcd kubernetes

## 修改配置文件
### docker
```
cd /etc/sysconfig
vi docker
options更改为
OPTIONS='--selinux-enabled --insecure-registry gcr.io'

```


### kube

```
cd /etc/kubernetes/
vi apiserver
去掉--ADMISSION_CONTROL的 ServiceAccount

```



## 启动任务
systemctl start etcd  
systemctl start docker  
systemctl start kube-apiserver    
systemctl start kube-controller-manager  
systemctl start kube-scheduler  
systemctl start kubelet  
systemctl start kube-proxy  

## 重新启动任务

systemctl restart kubelet
systemctl restart kube-controller-manager
systemctl restart kube-apiserver


## 停止任务

systemctl stop etcd  
systemctl stop docker  
systemctl stop kube-apiserver    
systemctl stop kube-controller-manager  
systemctl stop kube-scheduler  
systemctl stop kubelet  
systemctl stop kube-proxy