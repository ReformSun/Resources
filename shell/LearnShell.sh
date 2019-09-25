#!/usr/bin/env bash

#  随机数
# https://www.cnblogs.com/ginvip/p/6363120.html
dd="dddddd"
# echo ${dd//[0-9]/}
echo $dd | grep '[:.0-9]'
cc="08.05.2019 12:54:47 : ac30e1322dc9f39e49c88d4eba5254e8 : Flink Streaming Job (RUNNING)"
#echo $cc | grep '[:0-9]' | awk '{ print $4; }'
# echo $cc | awk '{ print $4; }'
cc="1:2:3"
# echo $cc | awk '{ print $2; }'
echo $cc | awk -F":" '{ print $2; }'
cc="d\\ndd\\ndd"
echo $cc
# 流程控制 if 
a=""
# a 等于空
if [ -z "${a}" ]
then
    echo "a 为空"
fi
# if else
a="b"
# 
if [ -z "${a}" ]
then
    echo "a 为空"
# a 等于 a
# elif [ ${a} = "a" ]可以 、[ ${a} == "a" ]可以、[ a = "a" ]不可以、[ a == "a" ]不可以
elif [ ${a} = "a" ]
then
    echo "a 等于a"
else
    echo "a 不等于a"
fi

# 不等于空
f=""
#  f不等于空
if [ -n "${f}" ]
then
    echo "f不等于空"
else
    echo "f等于空"
fi

# 循环语句
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done