# Elasticsearch 优化
## 过期数据
	日志数据以天建立索引，但是随着时间的推移，基于时间的数据，被查询使用的频率会越来越少，有可能会查看上周、上个月或者上年的数据，但是这样的查询会非常少，我们大多数情况先只关注的是当前的数据。
### 处理过期数据的方式
#### 删除过期数据
	这种方式是终极的方式，一般不赞成
#### 迁移数据
在启动不同的节点时，把热数据都存储在性能比较好的服务器中，所以我们在启动时就根据不同服务器的性能情况，作为不同数据的存储机器

./bin/elasticsearch --node.box_type strong


#### 索引优化









#### 引用文章
[数据过期](https://www.elastic.co/guide/cn/elasticsearch/guide/cn/retiring-data.html#migrate-indices)
[段合并](https://www.elastic.co/guide/cn/elasticsearch/guide/cn/merge-process.html#optimize-api)
