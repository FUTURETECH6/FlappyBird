<br/>

<center><img src = "./Report.assets/P1.png" style = "zoom:1.4"></center>
<br/>

<center><img src = "./Report.assets/P2.png" style = "zoom:55%"></center>

<br/>
<br/>
<br/>
<br/>
<br/>

<center style="font-size:2.5rem;font-weight:bold">数字逻辑设计：课程报告</center><br/>
<center style="font-size:2rem;font-weight:bold">基于数字系统的Flappy Bird游戏</center><br/>
<center style="font-size:1.5rem"><strong>作者：陈希尧</strong></center><br/>
<center style="font-size:1.5rem"><strong>日期</strong>：2019年12月26日</center><br/>
<div STYLE="page-break-after: always;"></div>
<br><center><font size = "5" color = "0xAAAAEE">目录</font></center>

[TOC]

## Thoughts



## Design

### 重要参数说明

在各个模块中同名的参数，为了适应各模块功能，其类型可能不一定相同。

#### 逻辑相关

**State**

用于记录当前状态，有三个状态，可以以如下条件进行转换。

```mermaid
graph LR

0(0) -.按下按钮.-> 1(1)
1 -.死亡.-> 2(2)
2 -.重置游戏.-> 0
```

对于其状态的切换是在顶层模块`Top_FlappyBird`中进行的

**isDead**

在`Bird_Ctrl`中进行死亡判断，并一直传递回顶层模块，

#### 显示相关

**RGB_R, RGB_G, RGB_B**

在Display中是`wire`类型，记录当前像素(行列作标分别为`Y_Addr`, `X_Addr`)处的颜色信息，并传递给`vgac`模块进行颜色显示。

### 重要模块说明

#### Display

#### Bird_Ctrl

**功能**

* 进行撞击判断鸟是否已死，修改`isDead`并传回
* 控制鸟的速度大小与方向进而改变其垂直位置并输出回`Display`
* 

#### Pipe_Generator

**功能**

* 记录已通过的管子数作为分数`score`作为输出回传到`Display`进行显示





## Debugging Logs

### VGA Display

1. 我第一次上板验证的情况是这样的：

   <img src="Report.assets/image-20191226173518505.png" alt="image-20191226173518505" style="zoom:25%;" />

   颜色和所调用的图层的颜色是一样的，但是位置和图案显然错误。初步猜测这是由于扫描同步失败导致的，进而检查自己的源码，首先是`vgac`的检查，然而在之前的测试中，`vgac`是可以正常使用的，因此并不是造成事故的原因

### 



## 

