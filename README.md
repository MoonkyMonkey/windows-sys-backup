# windows-sys-backup
a project that keep backup windows system.

> 这个项目保证系统重装后更轻松部署

##  一. 系统封装

###   1. windows10 安装
> 需要工具 VMware 12虚拟机 + windows10 镜像 + DiskGenius4.7.2-X64 磁盘分区工具

> 参考帖子  [十分钟学会win10系统封装之系列教程（一）](http://www.yishimei.cn/network/706.html).

一些详细操作见帖子，其中主要需要注意的有

1. 创建磁盘时将磁盘创建为单个文件可以给分区工具分区。
2. 为了封装系统的兼容性，将“USB控制器”、“声卡”、“打印机”全部移除，如果有“网络适配器”也要移除，然后点击“关闭”。
3. 使用分区工具分区后再进入安装系统程序。
4. BIOS设置需要 `disabled` 掉 `Legacy Diskette A` `Serail port A`  `Serail port B` `Parallet port`  `Floppy disk controller`
   然后改变启动项顺序进行dvd安装系统。
5. 系统安装完成后需要用虚拟机拍一下快照。（我安装完之后出现安装错误的窗口，只需要点确认就可以继续安装无需理会错误）

最新的系统需要进行一些个性化设置之后才能进入系统，需要先创建用户名。

（由于其中一个补丁的原因，更新了最新win10系统之后就卡在全屏的个性化设置然后桌面黑屏的问题， 然后我进行了系统修复，虽然修复成功了但是电脑蓝屏次数变得十分频繁不得已开始这个项目）

###   2.

#### 其他地址
1. [最全的微软msdn原版windows系统镜像和office下载地址集锦](http://www.yishimei.cn/network/290.html).
