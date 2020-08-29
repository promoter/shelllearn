//reference：http://c.biancheng.net/cpp/view/7011.html

### shell种类

sh、csh、tcsh、ash、bash等

查看当前linux可用shell:

`cat /etc/shells`

### PS1和PS2空指提示符格式

`echo $PS1`

`root@iZx3842s192qknZ:/usr/local# echo $PS1`
`[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$`

`echo $PS2`

### helloworld

`#!/bin/bash`

`echo -e "Hello World ! \n"`

e表示对转义字符进行转义

### 注释

“#”开头的行就是注释

### 执行

```
chmod +x ./test.sh  #使脚本具有执行权限
./test.sh  #执行脚本
```

### 变量

`url=http://www.cnencmap.com:8081/archives`

`name='我的博客'`

`author="promoter"`

`echo $url`
`echo $name`
`echo $author`

注意=号两边不能有空格，修改变量重新赋值即可。

{ }帮助解释器识别变量的边界（注意此时必须用双引号，单引号会原样输出单引号中的文本）:

`echo "I love ${author}"`

删除变量，uset(不能删除只读变量)：

`uset author`

### 只读变量

readonly修饰只读变量，如果修改将报错（当时不会暂停脚本的继续执行）

`readonly author`

### 将命令的结果赋值给变量

```
variable=`command`
variable=$(command)
```

输出时间：

```
DATE=`date`
echo "Date is $DATE"
```

### 特殊变量

```
echo '当前pid,$$:' $$
echo '当前脚本文件名,$0:' $0
echo '$n传递参数n:' "first Parameter:$1" "second Parameter:$2"
echo '$*和$@传递所有参数' $* $@
echo '$#传递参数个数:' "parameter count:$#"
echo '$?获取上一个命令的退出状态,0代表成功,1代表失败 ' $?
```

### 文本替换

```
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
```

### 算术运算

```
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
```

### 关系运算

