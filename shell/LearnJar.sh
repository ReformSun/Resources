#!/usr/bin/env bash


#用法: jar {ctxui}[vfm0Me] [jar-file] [manifest-file] [entry-point] [-C dir] files ...
#选项包括:
#    -c  创建新的归档文件
#    -t  列出归档目录
#    -x  从档案中提取指定的 (或所有) 文件
#    -u  更新现有的归档文件
#    -v  在标准输出中生成详细输出
#    -f  指定归档文件名
#    -m  包含指定清单文件中的清单信息
#    -e  为捆绑到可执行 jar 文件的独立应用程序
#        指定应用程序入口点
#    -0  仅存储; 不使用情况任何 ZIP 压缩
#    -M  不创建条目的清单文件
#    -i  为指定的 jar 文件生成索引信息
#    -C  更改为指定的目录并包含其中的文件
#如果有任何目录文件, 则对其进行递归处理。
#清单文件名, 归档文件名和入口点名称的指定顺序
#与 'm', 'f' 和 'e' 标记的指定顺序相同。
#
#示例 1: 将两个类文件归档到一个名为 classes.jar 的归档文件中:
#       jar cvf classes.jar Foo.class Bar.class
#示例 2: 使用现有的清单文件 'mymanifest' 并
#           将 foo/ 目录中的所有文件归档到 'classes.jar' 中:
#       jar cvfm classes.jar mymanifest -C foo/ .


# 1. 测试
#cd /Users/apple/Documents/AgentJava/intellProject/testShell/
#ls
## 包含testFile目录内所有文件和testFile目录
#jar cvf ideal.jar testFile
## 包含testFile目录所有文件但不包含testFile目录
#jar cvf ideal.jar -C testFile/ .


jar cvf /Users/apple/Documents/AgentJava/intellProject/testShell/testFile/test.jar manifest.mf -C /Users/apple/Documents/AgentJava/intellProject/testShell/src/com/test/ .

