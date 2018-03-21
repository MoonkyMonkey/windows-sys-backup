net stop HomeGroupListener
sc config HomeGroupListener start= disabled
net stop HomeGroupProvider
sc config HomeGroupProvider start= disabled
net stop BthHFSrv
sc config BthHFSrv start= disabled
net stop Fax
sc config Fax start= disabled
net stop SCardSvr
sc config SCardSvr start= disabled
net stop ScDeviceEnum
sc config ScDeviceEnum start= disabled
net stop SCPolicySvc
sc config SCPolicySvc start= disabled
net stop Spooler
sc config Spooler start= disabled
net stop Superfetch
sc config Superfetch start= delayed-auto
net stop WSearch
sc config WSearch start= delayed-auto


powercfg -h on
powercgf -h off