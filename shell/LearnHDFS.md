## 查看edit文件
./hdfs oev -i /Users/apple/Desktop/Server/data/hadoop/hdfs/name/current/edits_inprogress_0000000000000000093 -o /Users/apple/Desktop/edits.xml
## 查看fsimage文件
./hdfs oiv -i /Users/apple/Desktop/Server/data/hadoop/hdfs/name/current/fsimage_0000000000000000092 -p XML -o /Users/apple/Desktop/fsimage.xml

./hdfs oiv -i /Users/apple/Desktop/Server/data/hadoop/hdfs/name/current/fsimage_0000000000000000092 -o /Users/apple/Desktop/fsimage.ls
cat /Users/apple/Desktop/fsimage.ls


## HDFS 高可用启动

nn hdfs01 hdfs02

在hdfs01
sbin/hadoop-daemon.sh start journalnode
格式化nn
bin/hdfs namenode -format
启动nn
sbin/hadoop-daemon.sh start namenode
在hdfs02上同步在hdfs01的nn数据
bin/hdfs namenode -bootstrapStandby
启动hdfs02上的nn
sbin/hadoop-daemon.sh start namenode

在hdfs01上启动dn
sbin/hadoop-daemons.sh start datanode

查看hdfs01和hdfs02的状态
bin/hdfs haadmin -getServiceState hdfs01
bin/hdfs haadmin -getServiceState hdfs02

切换hdfs01为active
bin/hdfs haadmin -transitionToActive hdfs01
再次查看hdfs01的状态
bin/hdfs haadmin -getServiceState hdfs01

关闭所有服务
sbin/stop-dfs.sh
启动zk集群
bin/zkServer.sh start
格式化zk错误恢复服务
bin/hdfs zkfc -formatZK
启动hdfs服务
sbin/start-dfs.sh
sbin/hadoop-daemin.sh start zkfc

启动hdfs服务


