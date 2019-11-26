基本格式：rar <command> [-<switch>] file.rar [files][path]
    command:        //指定 rar 命令执行的具体动作
     a                       //若指定的 file.rar 文件不存在，则将 files 指定的文件添加(压缩)至 file.rar 中 
     e                       //解压文件至当前目录，注意所有的文件均被解压至当前目录，原有的目录结构不会被保留
     l                       //列出压缩文件的内容，与 v 基本相同，但不包括文件路径
     t                       //测试压缩文件
     v                       //显示压缩文件的详细资料
     x                       //将文件解压至 path 指定的路径下

    switch:         //针对 rar 某部分功能的启停，每个 switch 以 - 开始，通过空格键隔开
     -r                     //对子目录递归使用
     -o+                    //覆盖已存在的文件
     -o-                    //不覆盖已存在的文件
     -x<file>               //去除指定的文件

     rar a -r experiment.rar ~/experiment/　　//将目录 ~/experiment/ 添加(压缩)至文件 experiment.rar 文件，注意这里要使用 -r ，否则只会添加 ~/experiment/ 目录下的所有文件，而不会处理其中的子目录的内容

　　rar l experment.rar　　　　　　　　　　//查看 rar 文件的信息

　　rar x experment.rar ~/test/　　　　　　   //将文件 experiment.rar 文件解压至指定的文件夹