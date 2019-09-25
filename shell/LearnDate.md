## 查看当前时间的命令行
```
date +%Y 以四位数字格式打印年份
date +%y 以二位数字格式打印年份
date +%m 月份
date +%d 日期
date +%H 小时
date +%M 分钟
date +%S 秒
date +%w 星期，如果结果显示0，则表示周日
前一天的日期
date -d "-1 day" +%d
 
前一小时
date -d "-1 hour" +%H
 
前一分钟
date -d "-1 min" +%M
 
前一秒钟
date -d "-1 second" +%S

date %Y-%m-%d %H:%M:%S

```

## 同步服务器时间
ntpdate ntp1.aliyun.com
