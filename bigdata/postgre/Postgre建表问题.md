# 问题
## 问题1
###建表sql  
```
DROP TABLE IF EXISTS "public"."alarm_filter";
CREATE TABLE "public"."alarm_filter" (
"filter_rule_id" int8 DEFAULT nextval('alarm_filter_filter_rule_id_seq'::regclass) NOT NULL,
"alarm_id" int8,
"filter_column" varchar(255),
"filter_sign" varchar(20),
"filter_condition" varchar(255),
"dataset_id" int8
)
WITH (OIDS=FALSE);
COMMENT ON TABLE "public"."alarm_filter" IS '报警设置过滤条件';
COMMENT ON COLUMN "public"."alarm_filter"."alarm_id" IS '报警唯一id';
COMMENT ON COLUMN "public"."alarm_filter"."filter_column" IS '过滤字段';
COMMENT ON COLUMN "public"."alarm_filter"."filter_sign" IS '>、>=、==、<、<=、!=、包含、不包含、IS NULL、NOT NULL';
COMMENT ON COLUMN "public"."alarm_filter"."filter_condition" IS '过滤条件值';
COMMENT ON COLUMN "public"."alarm_filter"."dataset_id" IS '数据集ID';
```
### 报错 
```
ERROR:  relation "alarm_filter_filter_rule_id_seq" does not exist
```

### 解决办法
在建表sql执行之前执行下面的sql

```
CREATE SEQUENCE alarm_filter_filter_rule_id_seq START 1;
```
