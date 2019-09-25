# Elasticsearch 安装部署文件
## 下载地址
[elasticsearch](https://www.elastic.co/cn/downloads/past-releases#elasticsearch)选择自己想要的版本  
以[elasticsearch-7.3.2-linux-x86_64.tar.gz](https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.3.2-linux-x86_64.tar.gz)为例
## 解压
```
	tar -zxf elasticsearch-7.3.2-linux-x86_64.tar.gz
```
## 创建es用户并设置密码
添加用户  
adduser es
修改密码  
passwd es  
## 修改elasticsearch所在目录的访问权限
在root用户下  
su root  
chown -R es:es /opt/elasticsearch-7.3.2/  
修改在配置文中设置的log和data目录的权限或者  
chown -R es:es /root/  
## 修改linux系统的配置文件
在root用户下
su root  
vi /etc/security/limits.conf 
 
```
#<domain>      <type>  <item>         <value>
#*               soft    core            0
#*               hard    rss             10000
#@student        hard    nproc           20
#@faculty        soft    nproc           20
#@faculty        hard    nproc           50
#ftp             hard    nproc           0
#@student        -       maxlogins       4
es              -       memlock         unlimited
es              -       nofile          65536
es              -       nproc           65535

```
es - memlock unlimited  
当前用户能打开的最大文件数  
es - nofile 65536 
当前用户能打开的最大进程数 
es - nproc 65535  
vi /etc/sysctl.d/99-sysctl.conf  
vm.max_map_count=262144  
sysctl -p


## 修改配置文件
`vi elasticsearch.yml`  
### 集群配置
- cluster.name 集群名字 如果是多集群名字必须相等  
`cluster.name: my-es`  
- node.name 节点名  
`node.name: node1`

### 路径
- 索引数据的存储位置  
`path.data: /root/esdata/data`
- 日志的存储路径  
`path.logs: /root/esdata/logs`
- 临时文件路径  
`path.work: /root/esdata/work `

### 基本配置
- 设置当前的ip地址,通过指定相同网段的其他节点会加入该集群中  
`network.host: 0.0.0.0`  
<font color=red>注意：</font> 必须写0.0.0.0 不然会报错
- 对外提供服务的端口号  
`http.por: 9200`
- 集群中master节点的初始列表，可以通过这些节点来自动发现新加入集群的节点  
`discovery.zen.ping.unicast.hosts: ["node-1"]`  
- 最多发现主节点的个数  
`discovery.zen.mininum_master_nodes: 3`  
- 当重启集群时，最小启动N个节点才会执行恢复  
`gateway.recover_after_nodes: 3`  
- 在一台机器上启动个节点个数  
`node.max_local_storage_nodes: 1`

### 内存
- 锁定物理内存地址，防止es内存被交换出去，也就是避免es使用swap交换分区，频繁的交换，会导致IOPS变高。  
`bootstrap.memory_lock: true`
- 节点用于 fielddata 的最大内存，如果 fielddata  两种方式建议采用百分的方式  
`indices.fielddata.cache.size: 50mb `
`indices.fielddata.cache.size: 10% `
- fielddata断路器设置的占jvm的内存的百分比  
`indices.breaker.fielddata.limit: 60% `
- 数据节点  
`node.data: true `


### 设置集群节点的角色
- 主机节点  
` node.master: false`
- 数据节点  
`node.data: true `
### 索引配置
- 设置索引的分片数,默认为5  "number_of_shards" 是索引创建后一次生成的,后续不可更改设置   
` index.number_of_shards: 5`  
- 设置索引的副本数,默认为1    
` index.number_of_replicas: 1`  
- 索引的刷新频率，默认1秒，太小会造成索引频繁刷新，新的数据写入就慢了。 
` index.refresh_interval: 120s`  


## 启动
- 前台启动  
./bin/elasticsearch
- 后台启动  
./bin/elasticsearch -d

## 查看进程
ps -ef|grep elasticsearch

## 停止进程
ps aux|grep elasticsearch|grep -v grep|awk '{print $2}'|xargs kill -9

## 引用
[Linux 用户线程数与文件句柄树调整(nproc与nofile的问题)](https://blog.ct99.cn/?p=3260)
