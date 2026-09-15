####--------2.2数据类型----------#######
##############特殊值##############
n <- NULL
n
0/0
#c(1,2,3,NA) 为一个向量
#它包含4个元素，其中最后一个元素为NA
#求它的平均数将返回NA
mean(c(1,2,3,NA))
#可以调整mean() 函数的参数来忽略NA
mean(c(1,2,3,NA),na.rm=TRUE)
is.infinite (Inf+1)
####--------2.3数据结构----------#######
##############（2.3——1）向量##############
###（2.3——1——1）向量的类型
# x为一个"标量"
x <- 1
#计算x的长度
length(x)
#判断x是否为向量
is.vector(x)
#创建一个包含3个双精度元素的数值型向量
x <- c(1,2,3)
typeof(x)
#创建一个包含3个整数元素的数值型向量
y <- c(4L,5L,6L)
typeof(y)
z <- c(x,y)
typeof(z)
#使用numeric()函数、integer()和double()函数来创建一个由0组成的指定长度的向量
x <- numeric(8)
y <- integer(8)
z <- double(8)
x
y
z
#生成相邻元索相差-1或者1步长的序列
1:10
1:-10
#“:”运算符是seq()函数的一个特例,它可以使seq()函数更灵活地创建序列
seq(from = 1, to= 10)
seq(from = 1, to = -10)
#创建3到27且步长为3的序列
seq(from = 3, to = 27, by = 3)
#创建起点为4,长度为10且步长为2的序列
seq(from = 4, by= 2, length.out = 10)
#生成两个字符串向量
x <- "R is useful ."
y <- c("R","is","useful",".")
x
y
#生成一个逻辑向量
z <- c(TRUE,TRUE,FALSE,FALSE)
z
#比较字符向量中处于相同位詈的元素是否相等
y == c("R","is","useful",".")
x == y
###（2.3——1——2）向量元素的命名
m <- c(apple=1,banana=2,cat=3,4)
m
n <- c("A","B","C","D")
names(n) <- c("apple","banana","","dog")
n
#读取向量的元素名称
names(m)
names(n)
###（2.3——1——3）提取向量的子集
x <- 1:26
names(x)<- LETTERS # 大写字母
x
#通过正整数提取向量子集
x[1]
x[4:8]
#若正整数重复了一次,则元素也会重复一次
x[c(10,10)]
#若方括号中为小数,则会先截尾再提取子集
x[c(5.3,5.9)]
#通过负整数提取不包含相应元素的子集
x[-c(12:20)]
#但方括号中不能同时包含正整数和负整数
x[c(13,-18)]
#通过逻辑向量提取子集
y <- c(rep(TRUE,10),rep(FALSE,16))
y
x[y]
z <- x > 20
z
x[z]
#通过元素名称提取子集
x[c("E","L","O")]
###（2.3——1——4）向量的强制转换
#m是数字字符"10"
m <- "10"
#n是数值3
n <- 3
#若两者进行求和运算会如何
m+n
#使用as.numeric将m强制转换为数值
m <- as.numeric(m)
m + n
#逻辑型向量加数值型向量
TRUE+ 1
#字符型向量加数值型向量
"1" + 1
##############（2.3——2）矩阵和数组##############
###（2.3——2——1）创建矩阵和数组
#创建一个3行4列的数值向量
#nrow和ncol通常只需设置其中一个即可
x <- matrix(1:12,nrow = 3,ncol = 4)
x
#创建三维数组,第一维长度为4,第二维长度为3,第三维长度为2
y <- array(letters[1:24],dim = c(4,3,2))
y
#用diag()函数创建对角矩阵：
diag(x=1,nrow = 6)
#通过dim() 函数返回矩阵和数组各维度的长度
dim(x)
dim(y)
#nrow()和ncol()函数分别表示行数和列数
nrow(x)
ncol(x)
#dim()函数用于向量时,将返回NULL
dim(c(2,4,6))
###（2.3——2——2）对矩阵和数组命名
#在创建数组时,通过dimnames参数设定名称
#dimnames参数接受列表这种数据结构
#矩阵的命名方式与此相同
z <- array(1:24,dim=c(4,3,2), 
           dimnames = list(c("rowl","row2","row3","row4"),
                           c("col1","col2","col3"), 
                           c("第一组","第二组") 
           ))
z
#dimnames() 函数可对各维度进行命名,或者使用rownames()和colnames()函数分别对行和列命名
z <- array(1:24,dim = c(4,3,2))
rownames(z)<- c( "rowl","row2","row3","rows")
colnames(z)<- c("col1","col2","col3")
z
dimnames(z) <- list (c("row1","row2","row3","rows"),
                     c ("col1","col2","col3"),
                     c("第一组","第二组"))
z
###（2.3——2——3）提取矩阵和数组的子集
o <- z[c(2,3),2,1]
p <- z[c(-1,-4),2,1]
q <- z[c(2,3),c(FALSE,TRUE,FALSE),c(TRUE,FALSE)]
r <- z[c("row2","row3"),"col2","第一组"]
identical(o,p)
identical(p,q)
identical(q,r)
x <- matrix(1:12,3,4)
#取矩阵的一行
x1 <- x[1,]
#取矩阵的一列
x2 <- x[,1]
is.vector(x1)
is.vector(x2)
#希望结果依然是矩阵
x3 <- x[1,,drop = FALSE]
x3
is.matrix(x3)
x4 <- x[,1,drop = FALSE]
x4
is.matrix(x4)
##############（2.3——3）因子##############
###（2.3——3——1）创建因子
x <- c(7,7,7,3,3,3,1,1,1)
fct <- factor(x)
fct
levels(fct)
gl(n = 3,k = 3)
#查看fct的结构
str(fct)
fct1 <- fct
fct1[10] <- 20
fct1
fct2 <- fct3 <- fct
#将新加入的元素变为7
fct2[10] <- 7
fct2
#先改变因子的水平,再加入原水平以外的元素
levels(fct3)<- c(levels(fct3),20,30)
fct3
fct3[c(10,11)]<- c(20,30)
fct3
###（2.3——3——2）改变因子水平
choices <- c("非常同意","同意","不确定","不同意","非常不同意")
#有放回地抽取choices中的元素,重复100次
results <- sample(choices,100,replace = TRUE)
# R语言默认的因子水平顺序
fct4 <- factor(results)
levels(fct4)
#生成有序因子,并指定了因子水平的顺序
fct5 <- ordered(results,levels = choices)
levels (fct5)
#提取fct5中没有"不确定"的子集
fct6 <- fct5[!(fct5 %in% "不确定")]
#计算fct6的长度
length(fct6)
#查看fct6的因子水平
levels(fct6)
#去掉没有使用的因子水平
fct7 <- droplevels(fct6)
levels(fct7)
##############（2.3——4）列表##############
###（2.3——4——1）创建列表
l<-list("电视机","日本",FALSE,10000)
###（2.3——4——2）列表的命名
l1<- list("电视机","日本",FALSE,10000)
names(l1)<- c("商品名","进口国","是否打折","价格")
l2 <- list("商品名"="电视机","进口国"="日本","是否打折"=FALSE,"价格"=10000)
l2
identical(l1,l2)
l3 <- list(
  "分量1"=seq(10,30,by = 3), 
  "分量2"= month.name, 
  "分量3"= matrix(LETTERS[-c(25,26)],4,6), 
  "分量4"=l2
)
#列表的分量数量，或者列表的长度
length (l3)
#l3具体内容
l3
###（2.3——4——3）提取列表子集
#＃使用[]提取列表的子集
l3[1]
l3["分量2"]
l3[c(FALSE,FALSE,TRUE,TRUE)]
is.list(l3[2])
#使用[[]]提取列表的子集
l3[[1]]
l3[[c(FALSE,FALSE,TRUE,TRUE)]]
is.matrix(l3[["分量3"]])
#使用$提取列表的子集
is.matrix(l3$"分量3")
#使用$提取列表的子集
l3$"分量1"< - 1:5
l3$"分量5"<- letters[1:15]
l3[c("分量2","分量3")] <- NULL
l3
##############（2.3——5）数据框##############
###（2.3——5——1）创建数据框
df1 <- data.frame(
  name= c("张三","李四","王五"),
  gender=c("男","男","女"),
  age=c(19,18,18),
  major=c("经济学","路桥工程","心理学")
)
df1
df1$name
df1 <- data.frame(
  name= c("张三","李四","王五"),
  gender=c("男","男","女"),
  age=c(19,18,18),
  major=c("经济学","路桥工程","心理学"),
  stringsAsFactors=FALSE
)
df1$name
#通过as.data.frame()函数将其他的数据结构转化为数据框
#将列表转化为数据框
m <- list(x = 1:5,y = 6:10)
m <- as.data.frame(m)
#将矩阵转化为数据框
n <- matrix(1:12,3,4)
n <- as.data.frame(n)
#数据框也可以像矩阵那样进行命名
dimnames (m) <- list (
  c("row1","row2","row3","row4","rows"),
  c("coll","col2"))
m
rownames(n)<- c("rowl","row2","row3")
colnames(n)<- c ("coll","col2","col3","col4")
n
###（2.3——5——2）提取数据框子集
df1[2:3,-2]
df1[c(FALSE,TRUE,TRUE),c("name","major")]
##############（2.3——6）原子向量和递归向量##############
###原子向量
#分别创建一个字符向量、矩阵和列表
x <- rep("R",10)
y <- matrix(1:12,3,4)
z <- list(x = 1,y = "R")
u <- as.data.frame(y)
#查看类型属性
typeof(x)
typeof(y)
typeof(z)
typeof(u)
#查看长度
length(x)
length(y)
length(z)
length(u)
#查看向量的属性
x <- 1:5
attributes(x)
names(x)<- letters[1:5]
attributes(x)
attr(x,"name")
#因子与一般的原子向最的区别就在于多了两个属性,类(class)和水平(levels)
x <- gl(3,2)
attributes(x)
#对因子命名后,就会多一个名字属性
names(x)<- letters[1:6]
attributes(x)
###递归向量
x <- list(a = 6:9,b = c("O","P","Q"),c = c(TRUE,FALSE))
attributes(x)
#可以用C()函数将多个列表组合成一个列表
y <- list(d = matrix(month.name,3,4))
z <- c(x,y)
z
#使用unlist()函数将一个列表转换为原子变量
x <- list(a = 1:3,b = 4:6)
unlist(x)
#如果列表中分量的数据类型不同,unlist()函数将采取强制转换
y <-list(a = c(TRUE,TRUE,FALSE),b=2:7)
unlist(y)
#数据框属性
x <- list(a = 1:3,b = 4:6)
attributes(x)
y <- as.data.frame(x,row.names = NULL)
attributes(y)