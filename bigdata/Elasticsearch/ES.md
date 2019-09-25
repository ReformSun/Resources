## ES DSL 过滤
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