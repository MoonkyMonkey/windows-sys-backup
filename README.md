#  windows-sys-backup（制作属于你自己的windows安装介质）
a project that keep install and backup windows system simple.

> 这个项目保证全新计算机的部署和系统备份更轻松

    捣鼓了两周左右的经验之谈。

## 目录
* [开始之前](#开始之前)

  * [说明](#说明)
  * [虚拟机准备](#虚拟机准备)
  
* [全新系统](#全新系统)
* [系统备份](#系统备份)
## 开始之前

###  说明

###  虚拟机准备

> 需要工具 VMware 12虚拟机 + windows10 镜像 + DiskGenius4.7.2-X64 磁盘分区工具

> 参考贴子  [十分钟学会win10系统封装之系列教程（一）](http://www.yishimei.cn/network/706.html)

    一些详细操作见帖子，其中主要需要注意的有，也可以使用实机更方便。

1. 创建磁盘时将磁盘创建为单个文件可以给分区工具分区，具体分区看帖子。
2. 为了封装系统的兼容性，将“USB控制器”、“声卡”、“打印机”全部移除，如果有“网络适配器”也要移除，然后点击“关闭”。
3. 使用分区工具分区后再进入安装系统程序。
4. BIOS设置需要 `disabled` 掉 `Legacy Diskette A` I/O设备选项中的 `Serail port A`  `Serail port B` `Parallet port`  `Floppy disk controller` 然后改变启动项顺序进行dvd安装系统。
5. 系统安装完成后`Ctrl+shift+F3`进入系统，需要用虚拟机拍一下快照。（我安装完之后出现安装错误的窗口，只需要点确认就可以继续安装无需理会错误）

        由于系统升级之后其他一个补丁的原因，出现更新完成系统卡在全屏的个性化设置然后桌面黑屏的问题， 虽然通过系统修复成功打开系统但是电脑蓝屏次数变得十分频繁不得已开始这个项目。

## 全新系统

### 共享文件
> 需要工具 
1. 开始菜单 -> 右键点击设置 -> 计算机管理 -> 本地用户和组 -> 解除administrator账户的禁用
2. 在虚拟机设置中添加usb控制器，把需要的软件放入U盘然后与虚拟机共享（一般得把U盘弹出之后在虚拟机右下角图标找到U盘并右键连接）
3. 安装Tools与机子共享U盘。（不使用映射网络盘是因为添加了网络设配器之后会联网会自动更新导致无法封装）

> 若安装Tools之后依然无法与主机共享剪切板与U盘等一般是需要重启虚拟机服务，不懂自行百度。

> 参考贴子 [十分钟学会win10系统封装之系列教程（二）：系统封装前的调整与文件交互](http://www.yishimei.cn/computer/710.html)
### 系统优化

1. 安装压缩软件2345好压。（也可以是其他解压软件主要用于解压其他压缩包,已经解压也可以不使用）
2. 在C盘建立`Tools`文件夹，把驱动助理放到里面，安装运行库。
3. 修改[`system.ini`](./system.ini)文件，让系统更好利用内存。
4. 修改注册表，把系统按照自己习惯进行个性化并优化系统。
5. 千万不要忘记移除USB控制器，卸载`VMware Tools`并重启，拍摄快照备份系统。

> 注册表文件太大了无法上传，以下是参考的帖子。


#### 个性化和优化 
1. 去除`人脉`，`多任务`图标，只显示`contana`图标，把`此电脑`，`控制面板`图标放在桌面。
2. 显示文件后缀名，文件夹显示大图标
3. 去除此电脑中的其他文件夹，只留下驱动器。
4. 调整了开始菜单，卸载了一些不需要的自带应用。

> 其他优化参考这里 
        
 
>参考贴子  [十分钟学会win10系统封装之系列教程（三）：系统封装前的优化与清理](http://www.yishimei.cn/computer/712.html)


### 系统封装

1. 打开Easysprep，进行设置之后封装之后关机
2. 进入pe系统，打开软件进入第二部分，完成相应设置之后开始第二部分封装
3. 使用装机工具生成win文件。
4. 重新安装工具将备份文件拷到电脑里。
5.使用ultraISO将win文件替换掉win10安装包里的install.win并另存为。

这样一个属于你自己的系统盘就做好了，可以做成启动光盘或者U盘下次使用。
> 参考帖子 [十分钟学会win10系统封装之系列教程（四）：软件部署安装与系统封装的完全阶段](http://www.yishimei.cn/computer/713.html)



## 安装后的自动部署

### 电脑目录的部署



### 软件的自动安装

#### 1. windows installer
一开始的idea就是把所有待安装的软件下载下来，然后用一个`.bat`脚本安装，通过文件夹进行软件更新存放。
并通过注册表修改默认的安装位置。

> [操作Windows注册表的简单的Python程序制作教程](http://www.jb51.net/article/63644.htm)

查了一下发现利用windows的静默安装很繁杂，每个软件都有不同的项目参数，不符合项目目标。

参考帖子

这是一篇比较实用的帖子。
> [Windows批处理：自动部署常用软件（静默安装）](https://www.cnblogs.com/sjy000/archive/2015/09/01/4775334.html)

其他关于静默安装的帖子
> [操作Windows注册表的简单的Python程序制作教程](http://www.360doc.com/content/14/1021/22/4171006_418800746.shtml)

> [常用软件的静默安装参数](http://blog.51cto.com/htxmn/1592511)

> [【静默参数大全】静默安装参数调用，静默查询操作方法](http://www.hx74.cn/content/?102.html)

附加四种安装类型的帖子
> [Windows软件静默安装](https://www.cnblogs.com/toor/p/4198061.html)

> [Installshield之静默安装](http://www.cnblogs.com/sabrinahuang/archive/2009/08/09/1542427.html)

> [inno setup命令行安装卸载参数](http://www.dingniu8.com/article/html/30386.html)

#### 2. Chocolatey - 更适合现代的安装方法
> 这是一个基于powershell的windows下命令行安装软件的工具，和linux系统一样只需要简单一行就可以安装软件。

> [Chocolatey的安装地址（英）]（https://chocolatey.org/install）

### 未来的发展方向

1. 熟悉使用`Wox`软件之后，减少桌面图标加快系统进程。
2. 安装完官方镜像之后，直接使用`Python`程序更改注册表及安装软件等实现自动部署。（程序中带有出错判断保证安全和稳健）
3. 制作自己个性化的`Windows To Go`系统。

## 系统备份




















## 其他地址
1. [最全的微软msdn原版windows系统镜像和office下载地址集锦](http://www.yishimei.cn/network/290.html)
2. [Windows10专业版、企业版、教育版各版本的区别](http://www.xitongtiandi.net/wenzhang/win10/16011.html)
