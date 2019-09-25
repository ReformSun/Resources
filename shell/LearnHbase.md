## hbase shell
### 进入hbase shell 命令环境
hbase shell
### 查看表
-> list
### 创建表
create 'mytable','cf'   // 至少创建一个列族

### 向表中添加数据
put 'mytable','first','cf:message','Hello HBase'
多增加几种类型的数据
put 'mytable','second','cf:foo',0x0
put 'mytable','third','cf:kk',1
put 'mytable','four','cf:ff',3.1415926

### 读数据
get 'mytable','first'
scan 'mytable' // 查看表中所有数据 谨慎使用


### 查看表的更详细的信息
describe 'mytable'