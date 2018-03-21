@echo stop VMware Services 
net stop VMwareHostd 
net stop VMAuthdService 
net stop VMnetDHCP 
net stop "VMware NAT Service" 
net stop VMUSBArbService

@echo start VMware Services
net start VMwareHostd 
net start VMAuthdService 
net start VMnetDHCP 
net start "VMware NAT Service"
net start VMUSBArbService
