# windows-sys-backup
a project that keep backup windows system.

> 这个项目保证系统重装后更轻松部署

##  一. 系统封装

###   1. windows10 安装
> 需要工具 VMware 12虚拟机 + windows10 镜像 + DiskGenius4.7.2-X64 磁盘分区工具

> 参考贴子  [十分钟学会win10系统封装之系列教程（一）](http://www.yishimei.cn/network/706.html)

一些详细操作见帖子，其中主要需要注意的有

1. 创建磁盘时将磁盘创建为单个文件可以给分区工具分区。
2. 为了封装系统的兼容性，将“USB控制器”、“声卡”、“打印机”全部移除，如果有“网络适配器”也要移除，然后点击“关闭”。
3. 使用分区工具分区后再进入安装系统程序。
4. BIOS设置需要 `disabled` 掉 `Legacy Diskette A` I/O设备选项中的 `Serail port A`  `Serail port B` `Parallet port`  `Floppy disk controller`
   然后改变启动项顺序进行dvd安装系统。
5. 系统安装完成后需要用虚拟机拍一下快照。（我安装完之后出现安装错误的窗口，只需要点确认就可以继续安装无需理会错误）

最新的系统需要进行一些个性化设置之后才能进入系统，需要先创建用户名。

（由于其中一个补丁的原因，更新了最新win10系统之后就卡在全屏的个性化设置然后桌面黑屏的问题， 然后我进行了系统修复，虽然修复成功了但是电脑蓝屏次数变得十分频繁不得已开始这个项目）

###   2. 准备工作
> 参考贴子 [十分钟学会win10系统封装之系列教程（二）：系统封装前的调整与文件交互](http://www.yishimei.cn/computer/710.html)

1. 安装 VMware tools。
2. 进入计算机管理里面的用户与组，删除解除administrator的禁用，注销进入administrator账户删除掉进入系统的账户。
3. 打开主机的文件夹共享（需要先添加网络设备，贴子中没有提到但是没有添加网络设备无法成功出现网络位置的共享文件夹）。
4. 同样的拍一下快照备份一下。

###   3.封装前的设置
参考帖子
>  [十分钟学会win10系统封装之系列教程（三）：系统封装前的优化与清理](http://www.yishimei.cn/computer/712.html)

1. 设置NAT网络，并用激活工具激活windows。
> [VMware设置NAT网络](https://jingyan.baidu.com/article/e8cdb32b4217e737052baddb.html)

2. 调出系统图标, 更新系统
3. 禁用“IE保护模式”和“SmartScreen筛选”
4. 服务优化

### 4.系统封装
参考帖子
>  [十分钟学会win10系统封装之系列教程（四）：软件部署安装与系统封装的完全阶段](http://www.yishimei.cn/computer/713.html)

。。。continue

## 二. 安装后的自动部署

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


TODO：
1. 系统安装完成后自动生成目录结构
3. 自动部署开发环境

#### 其他地址
1. [最全的微软msdn原版windows系统镜像和office下载地址集锦](http://www.yishimei.cn/network/290.html)
2. [Windows10专业版、企业版、教育版各版本的区别](http://www.xitongtiandi.net/wenzhang/win10/16011.html)
