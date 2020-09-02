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

加减乘除，余数，等于不等于：+ - * / % ==  != 

等于：-eq

不等于：-ne

大于：-gt

大于等于： -ge

小于： -lt

小于等于：-le

#### 非与或

!	-a	-o 

#### 字符串判断

长度是否为0： -z

长度是否不为0： -n

字符串是否为空 ： $a

### 检测文件属性

读写执行属性：

-r -w -x

文件(目录）是否存在：

-e

文件是否为常规文件：

-f

是否是文件夹

-d

文件大小是否为0：

-s

### 字符串处理

字符串长度： ${#a}

子字符串: ${a:1:4}

查找字符串：

```
echo `expr index "$string" is`
```

### 数组
数组使用：
`array_name=(v0 v1 v2 v3)`
array_name=(
v0
v1
v2
v3
)
array_name[0]=v0
array_name[1]=v1
array_name[2]=v2

读取数组某个值：
${array_name[0]}
读取所有值：
${array_name[*]}
${array_name[@]}
获取数组元素个数：
${#array_name[*]}
${#array_name[@]}

### 输入输出重定向
>输出会覆盖文件内容
echo "....just a  test" > myfile  
>>追加到文件末尾
echo "add a line " >> myfile
计算users文件中的行数：
wc -l < users
高级用法。。。。

### printf格式化输出
类似c语言一模一样地用法。
可以用单引号输出：
printf '%d %s\n' 1 "ffdfd"
也可以没有引号：
printf %s ddf dfd

### if then elif then else fi
a=10
b=20
if [ $a == $b ]
then echo "$a == $b"
elif [ $a -gt $b ]
then echo "$a >= $b"
elif [ $a -le $b ]
then echo "$a < $b"
else echo  "error"
fi

### test用于配合if检查某个条件是否成立

### case in esac 多分枝结构
case可以匹配一个值或者一个模式。
echo "please input nomber between 1 to 2:"
read aNum
case $aNum in
	1) echo ”you select 1"
	;;
	2) echo "you select 2"
	;;
	3) echo "you select 3"
	;;
	*) echo "input error, please input nomber between 1 to 2."
	;;
esac

option="${1}"
case ${option} in
	-f) file="${2}"
		echo "file name is $file"
	;;
	-d) dir="${2}"
		echo "dir name is $dir"
	;;
	*)
		echo "`basename ${0}`:usage: [-f file] | [-d directory]"
		# basename命令用于:去掉文件名的路径和后缀
		exit 1
	;;
esac

### for in do done 循环结构
输出主目录下.base开头的文件：
for file in $HOME/.base*
do
	echo $file
done

### while do done 循环结构
counter=0
while [ $counter -lt 5 ]
do
	counter='expr $counter+1'
	echo "$counter"
done
until命令和while循环相反，条件为false时执行循环。
continue跳出当前循环, break跳出循环。

### 函数
先定义后使用,可以嵌套使用.
$n获取参数，但是$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。
fun1(){
	echo "first parameter os $1" 
	echo "parameter count $# "
	echo "parameter all parameter $* "
	echo "1..."
	return "2"
}
#使用
fun1
ret=$?
echo "fun1 return $ret"

### 包括外部脚本 . filename 或者 source filename
被包含的脚本不需要执行权限。
1.sh
url="www.baidu.com"
2.sh
#!/bin/bash
. ./1.sh
echo $url





 





























