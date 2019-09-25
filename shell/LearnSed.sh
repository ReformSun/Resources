#!/bin/bash


# ^
# 锚定行的开始 如：/^sed/匹配所有以sed开头的行。
# $
# 锚定行的结束 如：/sed$/匹配所有以sed结尾的行。
# .
# 匹配一个非换行符的字符 如：/s.d/匹配s后接一个任意字符，然后是d。
# *
# 匹配零或多个字符 如：/*sed/匹配所有模板是一个或多个空格后紧跟sed的行。
# []
# 匹配一个指定范围内的字符，如/[Ss]ed/匹配sed和Sed。
# [^]
# 匹配一个不在指定范围内的字符，如：/[^A-RT-Z]ed/匹配不包含A-R和T-Z的一个字母开头，紧跟ed的行。
# \(..\)
# 保存匹配的字符，如s/\(love\)able/\1rs，loveable被替换成lovers。
# &
# 保存搜索字符用来替换其他字符，如s/love/**&**/，love这成**love**。
# \<
# 锚定单词的开始，如:/\<love/匹配包含以love开头的单词的行。
# \>
# 锚定单词的结束，如/love\>/匹配包含以love结尾的单词的行。
# x\{m\}
# 重复字符x，m次，如：/0\{5\}/匹配包含5个o的行。
# x\{m,\}
# 重复字符x,至少m次，如：/o\{5,\}/匹配至少有5个o的行。
# x\{m,n\}
# 重复字符x，至少m次，不多于n次，如：/o\{5,10\}/匹配5--10个o的行。
# 选定行的范围：逗号

testFilePath="/Users/apple/Desktop/testShell/LearnSed_text/test1.txt"
testXmlFilePath="/Users/apple/Desktop/testShell/LearnSed_text/pom.xml"
testXmlFileTargetPath="/Users/apple/Desktop/testShell/LearnSed_text/kk/pom.xml"
# sed -e '1,5d' -e 's/test/check/' $testFilePath



# sed -n '/test/,/check/p' $testFilePath   #所有在模板test和check所确定的范围内的行都被打印。
# sed -n '5,/^test/p' $testFilePath    #打印从第五行开始到第一个包含以test开始的行之间的所有行。
#sed '/test/,/check/s/$/sed test/' $testFilePath 
# i="ddd"
# stri="-ccccc"
array=("IdealAgent4Java336" "RemoteSystemsTempFiles")

# for i in $array 
# do
# 	sed "s/<artifactId>dependency<\/artifactId>/<artifactId>"${i}"<\/artifactId>/;s/<groupId>.*<\/groupId>/<groupId>"${i}"<\/groupId>/" $testXmlFilePath > $testXmlFilePath

# done

# sed "s/<artifactId>dependency<\/artifactId>/<artifactId>"ddd"<\/artifactId>/;s/<groupId>dependency<\/groupId>/<groupId>"ddd"<\/groupId>/" $testXmlFilePath > $testXmlFilePath

x=1

# sed -i "ddd" '$a # This is a test' /Users/apple/Desktop/testShell/LearnSed_text/test1.txt

#  向文件中某行插入字符串
# sed -i "" "2 a\ 
# xxx
# " /Users/apple/Desktop/testShell/LearnSed_text/pom.xml
# 遍历文档中匹配项并截取字符串
# var=$(sed -n '/<artifactId>.*<\/artifactId>/p' $testXmlFilePath)
lineNu=$(sed -n "/<systemPath>\${pom.basedir}\/..\/..\/lib/=" $testXmlFilePath)
# echo $lineNu
# temNum=1
# lineVar=`expr $lineNu + 1`
# lineVarr=`expr $lineNu + 2`
# echo $lineVar
# num=0
# for i in $lineNu
# do

# 	lineNum=`expr $i - 2 + $num`
# 	echo $lineNum
# 	sed -i "" "$lineNum a\ 
# 	<version>1.0</version>
# 	" $testXmlFilePath
# 	num=`expr $num + 1`
# 	echo $num

# done

# sed -i "" "${lineNu-ddd}s/<version>1.0-SNAPSHOT<\/version>/jjjjj/" $testXmlFilePath
# sed -i "" "${lineVar},${lineVarr}d" $testXmlFilePath




# sed -i "" "$lineNu a\ 
# \$\{pom.basedir\}\/..\/..\/lib/$strr
# " $testXmlFilePath


# var=$(sed -n '9p' $testXmlFilePath)
# echo $var
# for i in $var 
# do
# 	strin=${i#*>}
# 	str=${strin%<*}
# 	echo $str
# done


# 删除
 # sed -i "" "/<scope>provided<\/scope>/d" $testXmlFilePath
 sed -i "" "s/<version>1.0-SNAPSHOT<\/version>/<version>\${project.version}<\/version>/" $testXmlFilePath








