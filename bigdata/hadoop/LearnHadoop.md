## hadoop 对文件的操作命令使用
### 创建文件夹
./hadoop fs -mkdir hdfs://localhost:9000/dir1
### 读取文件
./hadoop fs -cat hdfs://localhost:9000/dir1/test.txt
### 把本地文件拷贝到hadoop文件系统中
./hadoop fs -copyFromLocal /Users/apple/Desktop/Server/data/local/x_table.txt hdfs://localhost:9000/table/
### [-ls [-d] [-h] [-R] [<path> ...]]
./hadoop fs -ls hdfs://localhost:9000/dir1/  
./hadoop fs -ls hdfs://localhost:9000/dir2/dir3/
### -appendToFile
./hadoop fs -appendToFile /Users/apple/Desktop/Server/data/local/test.txt hdfs://localhost:9000/dir1/test.txt
### [-du [-s] [-h] <path> ...]
./hadoop fs -help du
./hadoop fs -du hdfs://localhost:9000/dir1/
### [-checksum <src> ...]
./hadoop fs -help checksum 
./hadoop fs -checksum hdfs://localhost:9000/dir1/test.txt
###	[-rm [-f] [-r|-R] [-skipTrash] <src> ...]
./hadoop fs -rm hdfs://localhost:9000/dir2/dir3/test5.txt
### [-chgrp [-R] GROUP PATH...]
### [-chmod [-R] <MODE[,MODE]... | OCTALMODE> PATH...]
### [-chown [-R] [OWNER][:[GROUP]] PATH...]
### [-copyToLocal [-p] [-ignoreCrc] [-crc] <src> ... <localdst>]
### [-count [-q] [-h] <path> ...]
### [-cp [-f] [-p | -p[topax]] <src> ... <dst>]
### [-createSnapshot <snapshotDir> [<snapshotName>]]
### [-deleteSnapshot <snapshotDir> <snapshotName>]
### [-df [-h] [<path> ...]]
### [-expunge]
### [-find <path> ... <expression> ...]
### [-get [-p] [-ignoreCrc] [-crc] <src> ... <localdst>]
### [-getfacl [-R] <path>]
###	[-getfattr [-R] {-n name | -d} [-e en] <path>]
###	[-getmerge [-nl] <src> <localdst>]
###	[-help [cmd ...]]
###	[-mkdir [-p] <path> ...]
###	[-moveFromLocal <localsrc> ... <dst>]
###	[-moveToLocal <src> <localdst>]
###	[-mv <src> ... <dst>]
###	[-put [-f] [-p] [-l] <localsrc> ... <dst>]
###	[-renameSnapshot <snapshotDir> <oldName> <newName>]
###	[-rmdir [--ignore-fail-on-non-empty] <dir> ...]
###	[-setfacl [-R] [{-b|-k} {-m|-x <acl_spec>} <path>]|[--set <acl_spec> <path>]]
###	[-setfattr {-n name [-v value] | -x name} <path>]
###	[-setrep [-R] [-w] <rep> <path> ...]
###	[-stat [format] <path> ...]
###	[-tail [-f] <file>]
###	[-test -[defsz] <path>]
###	[-text [-ignoreCrc] <src> ...]
###	[-touchz <path> ...]
###	[-truncate [-w] <length> <path> ...]
###	[-usage [cmd ...]]
