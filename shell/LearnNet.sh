# nc [-46AacCDdEFhklMnOortUuvz] [-K tc] [-b boundif] [-i interval] [-p source_port] [--apple-delegate-pid pid] [--apple-delegate-uuid uuid]
# 	  [-s source_ip_address] [-w timeout] [-X proxy_version]
# 	  [-x proxy_address[:port]] [hostname] [port[s]]
# 	Command Summary:
# 		-4		Use IPv4
# 		-6		Use IPv6
# 		-A		Set SO_RECV_ANYIF on socket
# 		-a		Set SO_AWDL_UNRESTRICTED on socket
# 		-b ifbound	Bind socket to interface
# 		-c		Send CRLF as line-ending
# 		-C		Don't use cellular connection
# 		-D		Enable the debug socket option
# 		-d		Detach from stdin
# 		-E		Don't use expensive interfaces
# 		-F		Do not use flow advisory (flow adv enabled by default)
# 		-G conntimo	Connection timeout in seconds
# 		-h		This help text
# 		-H keepidle	Initial idle timeout in seconds
# 		-I keepintvl	Interval for repeating idle timeouts in seconds
# 		-i secs		Delay interval for lines sent, ports scanned
# 		-J keepcnt	Number of times to repeat idle timeout
# 		-k		Keep inbound sockets open for multiple connects
# 		-K tclass	Specify traffic class
# 		-l		Listen mode, for inbound connects
# 		-L num_probes Number of probes to send before generating a read timeout event
# 		-m		Set SO_INTCOPROC_ALLOW on socket
# 		-n		Suppress name/port resolutions
# 		-M		Use MULTIPATH domain socket
# 		-N num_probes Number of probes to send before generating a write timeout event
# 		-O		Use old-style connect instead of connectx
# 		-p port		Specify local port for remote connects (cannot use with -l)
# 		-r		Randomize remote ports
# 		-s addr		Local source address
# 		-t		Answer TELNET negotiation
# 		-U		Use UNIX domain socket
# 		-u		UDP mode
# 		-v		Verbose
# 		-w secs		Timeout for connects and final net reads
# 		-X proto	Proxy protocol: "4", "5" (SOCKS) or "connect"
# 		-x addr[:port]	Specify proxy address and port
# 		-z		Zero-I/O mode [used for scanning]
# 		-o		Issue socket options after connect/bind
# 		--apple-delegate-pid pid	Set socket as delegate using pid
#  1、测试TCP端口

nc -vz ip tcp-port

#  2、测试UDP

nc -uvz ip udp-port

#  3、临时监听TCP端口

nc -l port

#  4、永久监听TCP端口

nc -lk port

#  5、临时监听UDP

nc -lu port

#  6、永久监听UDP

nc -luk port

# 列出当前系统所有端口信息
# linux系统上
netstat -tnlp
# mac上
# netstat [-AaLlnW] [-f address_family | -p protocol]
# 	netstat [-gilns] [-f address_family]
# 	netstat -i | -I interface [-w wait] [-abdgRtS]
# 	netstat -s [-s] [-f address_family | -p protocol] [-w wait]
# 	netstat -i | -I interface -s [-f address_family | -p protocol]
# 	netstat -m [-m]
# 	netstat -r [-Aaln] [-f address_family]
# 	netstat -rs [-s]


# 更改电脑mac地址
ifconfig  # 查看各个网卡情况
sudo ifconfig en0 ether 00:FF:1A:55:A4:5B # 更改en0网卡的mac地址
ifconfig en0 | grep ether # 查看en5现在的网卡mac地址

# 更改hosts文件

# 刷新DNS window
ipconfig flushdns
sudo vi /etc/hosts
mac 
sudo dscacheutil -flushcache 
sudo killall -HUP mDNSResponde
# 查看对应的的ip
nslookup github.com 










