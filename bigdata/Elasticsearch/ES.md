# ES DSL
```
curl -X<REST Verb> <Node>:<Port>/<Index>/<Type>/<ID>
　　<REST Verb>：REST风格的语法谓词
　　<Node>:节点ip
　　<port>:节点端口号，默认9200
　　<Index>:索引名
　　<Type>:索引类型
　　<ID>:操作对象的ID号
```
## 过滤
```
     GET itsource/employee/_search?q=fullName:倪先华
     DSL模式：
     GET itsource/employee/_search
     {
     "query" : {
        "match" : {
        		"fullName" : "倪先华"
  		}
     	}
     }
```

```
     {
     "sort" : {
          "time" : {
               "order" : "desc"
          }
     }
     }
```

## 增加
### 指定ID
```
PUT  <INDEX>/<TYPE>/<ID>
{
	"pathhash": "4",
    "pathhashName": "rc-53gvl",
    "pathhashType": "11"
}

```

## 日期范围查找
```
POST <INDEX>/<TYPE>/_search?pretty" -d '
{  
  "query": {
    "range": {
        "timeField": {
            "gte": "2018-09-01",
            "lte": "2018-12-30"
        }
    }
  }
}
```


## 修改
```
PUT  <INDEX>/<TYPE>/<ID>
{
	"pathhash": "4",
    "pathhashName": "rc-53gvl",
    "pathhashType": "11"
}

```

## 更新
```

POST   <INDEX>/<TYPE>/<ID>/_update

{
   "doc":{
       "pathhashType": "11"
   }
}

```

## 聚合
### 最大值
```
POST <INDEX>/_search?pretty" -d '
{  
"size": 0,
"aggs": {
    "max_price": {
      "max": {
        "field": "price"
      }
    }
  }
}'

```
### 求和
```
POST <INDEX>/_search?pretty" -d '
{  
"size": 0,
"aggs": {
    "sum_count": {
            "sum": {
                "field": "price"
            }
        }
  }
}'

```