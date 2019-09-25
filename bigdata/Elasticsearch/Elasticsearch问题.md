# Elasticsearch 出现的问题
## 单节点模式 
###问题描述
客户端通过tcp连接出现下面错误

```
Exception in thread "main" NoNodeAvailableException[None of the configured nodes are available: [{#transport#-1}{GRphuiRLRgOVTP0707mGFQ}{192.168.11.216}{192.168.11.216:9200}]]
```
### 问题
1. 启动配置文件没有指明发现方式为单节点模式  
discovery.type: single-node  
2. 客户端tcp连接client.transport.sniff设置为true 应设置成false
### 解决办法 
把客户端配置

```
Settings settings = Settings.builder().put("cluster.name","my-application1")
                .put("client.transport.sniff",false)  // true 多节点 false 单节点
                .build();
        if (client == null){
            synchronized (ESCacheDataImp.class){
                if (client == null){
                    client = new PreBuiltTransportClient(settings).addTransportAddress(new TransportAddress(new InetSocketAddress("172.31.6.226",9310)));
                }
            }
        }
```

client.transport.sniff 单节点模式下改为false

在elasticsearch 启动配置文件

```
cluster.name: my-application1
network.host: 0.0.0.0
http.port: 9210
transport.tcp.port: 9310
path.data: /root/esdata/data
path.logs: /root/esdata/logs
discovery.type: single-node
```