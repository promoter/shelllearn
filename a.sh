#!/bin/bash
echo -e "hello world.\n"
url=https://www.baidu.com
name='我的博客'
author="promoter"
echo $url
echo $name
echo $author
echo "I love ${author}"
echo "---------------------------------------"
DATE=`date`
echo "Date is $DATE"
echo "准备读取文件内容"
echo "读取方式1："
a_text=$(cat a.txt)
echo $a_text
echo "读取方式2："
a_text=`cat a.txt`
echo $a_text
readonly a_text
a_text="dfsfasdfsdf"
echo $a_text
echo '当前pid,$$:' $$
echo '当前脚本文件名,$0:' $0
echo '$n传递参数n:' "first Parameter:$1" "second Parameter:$2"
echo '$*和$@传递所有参数' $* $@
echo '$#传递参数个数:' "parameter count:$#"
echo '$?获取上一个命令的退出状态,0代表成功,1代表失败 ' $?
echo -e '\n ------------------------------'
echo '变量替换：'
echo "var is ${var}"
echo "?message查看错误信息，如果有错，脚本将停止执行"
#echo ${var:?message}
echo ${var:-word}
echo "var is ${var}"
echo ${var:+word1}
echo "var is ${var}"
echo ${var:=word2}
echo "var is ${var}"
echo '算术运算-----------------------'
a=10
b=20
val=`expr $a + $b`
echo "a + b : $val"
val=`expr $a - $b`
echo "a - b : $val"
val=`expr $a \* $b`
echo "a * b : $val"
val=`expr $b / $a`
echo "b / a : $val"
val=`expr $b % $a`
echo "b % a : $val"
if [ $a == $b ]
then
   echo "a is equal to b"
fi
if [ $a != $b ]
then
   echo "a is not equal to b"
fi




 
