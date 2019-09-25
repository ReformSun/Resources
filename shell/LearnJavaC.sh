#!/usr/bin/env bash

echo ${JAVA_7_HOME}
#
#classesPath="/Users/apple/Desktop/javaFile/classes"
#classPathR="/Users/apple/Desktop/javaFile/resource/flink-core-1.4.2.jar:/Users/apple/Desktop/javaFile/resource/flink-streaming-java_2.11-1.4.2.jar"
#sourcePath="/Users/apple/Desktop/javaFile/test.txt"
#javaPath="/Users/apple/Desktop/javaFile/flatMap_1/*.java:/Users/apple/Desktop/javaFile/socket_1/*.java:/Users/apple/Desktop/javaFile/standardTemplate/*.java"
#
#
#javac -d  ${classesPath} -classpath ${classPathR} -Xlint:unchecked ${javaPath}

basePath="/Users/apple/Documents/GitHub/LearnShell/src"
classOutPath="/Users/apple/Documents/GitHub/LearnShell/javacout"

# classesPath="/Users/apple/Documents/GitHub/LearnShell/javacout"
# toolsjarPath="${JAVA_7_HOME}/lib/tools.jar"
# javaPath="/Users/apple/Documents/GitHub/LearnShell/src/com/test/Test.java"

# java  -classpath ${toolsjarPath} ${javaPath}

# 用法: javac <options> <source files>
# 其中, 可能的选项包括:
#   -g                         生成所有调试信息
#   -g:none                    不生成任何调试信息
#   -g:{lines,vars,source}     只生成某些调试信息
#   -nowarn                    不生成任何警告
#   -verbose                   输出有关编译器正在执行的操作的消息
#   -deprecation               输出使用已过时的 API 的源位置
#   -classpath <路径>            指定查找用户类文件和注释处理程序的位置
#   -cp <路径>                   指定查找用户类文件和注释处理程序的位置
#   -sourcepath <路径>           指定查找输入源文件的位置
#   -bootclasspath <路径>        覆盖引导类文件的位置
#   -extdirs <目录>              覆盖所安装扩展的位置
#   -endorseddirs <目录>         覆盖签名的标准路径的位置
#   -proc:{none,only}          控制是否执行注释处理和/或编译。
#   -processor <class1>[,<class2>,<class3>...] 要运行的注释处理程序的名称; 绕过默认的搜索进程
#   -processorpath <路径>        指定查找注释处理程序的位置
#   -parameters                生成元数据以用于方法参数的反射
#   -d <目录>                    指定放置生成的类文件的位置
#   -s <目录>                    指定放置生成的源文件的位置
#   -h <目录>                    指定放置生成的本机标头文件的位置
#   -implicit:{none,class}     指定是否为隐式引用文件生成类文件
#   -encoding <编码>             指定源文件使用的字符编码
#   -source <发行版>              提供与指定发行版的源兼容性
#   -target <发行版>              生成特定 VM 版本的类文件
#   -profile <配置文件>            请确保使用的 API 在指定的配置文件中可用
#   -version                   版本信息
#   -help                      输出标准选项的提要
#   -A关键字[=值]                  传递给注释处理程序的选项
#   -X                         输出非标准选项的提要
#   -J<标记>                     直接将 <标记> 传递给运行时系统
#   -Werror                    出现警告时终止编译
#   @<文件名>                     从文件读取选项和文件名

#javac -sourcepath <java文件引用包的目录路径> <java文件的路径> -d <编译出来的class文件的存放的目录>
# 例如
javac -sourcepath ${basePath}/ ${basePath}/com/test/Test.java -d ${classOutPath}/




