## 查看磁盘
   df -h

## 查看详情
   du -h -x --max-depth=1

## 文件已删除 但是磁盘空间还被一直占用
   那是因为文件还被进程拥有没有别是释放，需要杀死进程，释放文件
   lsof |grep delete 查看未被释放的文件 再根据进程名 杀死进程