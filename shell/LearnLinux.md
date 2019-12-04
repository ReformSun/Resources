## 查看进程详情
ps -ef | grep pro
ls -l /proc/92918


cat /proc/pid/cwd: 文件所在目录
cat /proc/pid/exe：执行命令的完整路径
cat /proc/pid/environ： 执行命令时的环境变量


lsof -i:18101 查看那个端口被那个程序占用
sudo lsof -i :18101
ps -aux 查看终端上所有用户的相关进程信息


## linux 环境变量
1. 直接执行  
export JMETER_HOME=/opt/software/apache-jmeter-4.0  
export PATH=$JMETER_HOME/bin:$PATH  
2. 立刻生效  
source /etc/profile

## 启动项目的命令

nohup ./prometheus --config.file=./prometheus.yml & tail -200f nohup.out

nohup ./pushgateway & nohup.out
nohup ./grafana-server start &
nohup ./node_exporter & nohup.out


service grafana-server start