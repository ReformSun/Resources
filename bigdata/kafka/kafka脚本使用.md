# kafka-log-dirs
## 作用  
可以查看主题分区在服务器中占用字盘的信息

```
Missing required argument "[bootstrap-server]"
Option                                  Description
------                                  -----------
// 必填项
--bootstrap-server <String: The server  REQUIRED: the server(s) to use for
  (s) to use for bootstrapping>           bootstrapping
  
  // 指定要查看的broker索引值，不指定查看全部
--broker-list <String: Broker list>     The list of brokers to be queried in
      
                                        the form "0,1,2". All brokers in the
                                          cluster will be queried if no broker
                                          list is specified
--describe                              Describe the specified log directories
                                          on the specified brokers.
                                          
 指定主题的日志详情信息
--topic-list <String: Topic list>       The list of topics to be queried in
                                          the form "topic1,topic2,topic3". All
                                          topics will be queried if no topic
                                          list is specified (default: )
                                          
```

## 使用
```
// 查看主题名123abcd在172.31.35.58:9092中的日志详情信息
./bin/kafka-log-dirs.sh --bootstrap-server 172.31.35.58:9092 --describe --topic-list 123abcd

```

返回值  

```
{
    "version":1,
    "brokers":[
        {
            "broker":0, 
            "logDirs":[
                {
                    "logDir":"/tmp/kafka-logs",
                    "error":null,
                    "partitions":[
                        {
                            "partition":"123abcd-0",
                            "size":2210,
                            "offsetLag":0,
                            "isFuture":false
                        },
                        {
                            "partition":"123abcd-1",
                            "size":2210,
                            "offsetLag":0,
                            "isFuture":false
                        },
                        {
                            "partition":"123abcd-2",
                            "size":2205,
                            "offsetLag":0,
                            "isFuture":false
                        },
                        {
                            "partition":"123abcd-3",
                            "size":2211,
                            "offsetLag":0,
                            "isFuture":false
                        },
                        {
                            "partition":"123abcd-4",
                            "size":2137,
                            "offsetLag":0,
                            "isFuture":false
                        }
                    ]
                }
            ]
        }
    ]
}
```

# kafka-run-class.sh

### 查看消息元数据

```
./bin/kafka-run-class.sh kafka.tools.DumpLogSegments --files /tmp/kafka-logs/123abcd-0/00000000000000000000.log --deep-iteration

--deep-iteration 防止数据压缩展示不全，使用他可以展示清晰

--print-data-log 默认展示wrapper message

```



返回值  

```
offset: 0 
position: 0 
CreateTime: 1571797210961 
isvalid: true 
keysize: -1 
valuesize: 1 
magic: 2 
compresscodec: NONE 
producerId: -1 
producerEpoch: -1 
sequence: -1 
isTransactional: false 
headerKeys: []
```

# kafka-console-consumer.sh

```
// 从开始的地方进行消费并指定消费参数
./bin/kafka-console-consumer.sh --bootstrap-server 172.31.35.58:9092 --topic 123abcd --from-beginning --consumer-property group.id=serverCollector

```

# kafka-simple-consumer-shell.sh

```
0.11.0.0版本以前
./bin/kafka-simple-consumer-shell.sh --topic __consumer_offsets --partition 26 --broker-list 172.31.35.58:9092 --formatter "kafka.coordinator.GroupMetadataManager\$OffsetsMessageFormatter"

0.11.0.0版本以后(含)
./bin/kafka-simple-consumer-shell.sh --topic __consumer_offsets --partition 26 --broker-list 172.31.35.58:9092 --formatter "kafka.coordinator.group.GroupMetadataManager\$OffsetsMessageFormatter"

```




















