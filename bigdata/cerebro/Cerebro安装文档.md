# Cerebro 安装部署文件
## 下载地址
[Cerebro](https://github.com/lmenezes/cerebro)选择自己想要的版本  
以[cerebro-0.8.4.tgz](https://github.com/lmenezes/cerebro/releases/download/v0.8.4/cerebro-0.8.4.tgz)为例
## 解压
```
	tar -zxf cerebro-0.8.4.tgz
```

## 修改配置文件
`vi application.conf`  
### 配置
```
hosts=[
  {
  	# 监听的es的ip和端口
    host="http://localhost:9210"
    name="es_log"
  }
]
```
## 启动
- 前台启动  
./bin/cerebro
- 后台启动  
nohup ./bin/cerebro & nohup.out


## 引用
[Centos7 搭建Cerebro Elasticsearch监控](https://www.jianshu.com/p/e61c82af2e19)
