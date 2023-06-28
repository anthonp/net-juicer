# net-juicer
<p>I created this because I wanted another BASH challenge, and because it's useful! 3-4 tools in one.</p>

## Updates:
- 6/28/23 Nano, Slim, Speed Test versions
- 6/21/23 Added Layer 1 features (see wishlist)

## Dependencies: Python3
Disclaimer: This has only been tested on Fedora, Linux Mint, and Raspberry Pi Desktop (2023-05-03); you are on your own/responsible for making a pull request for your distro's support.


Debian/Ubuntu/PI:
```
sudo apt install python3
```
Fedora/DNF:
```
sudo dnf install python3
```
[Just go here ↗](https://docs.python.org/3/using/unix.html)

## Running:
```
chmod +x net-juicer-*.sh
```
```
./net-juicer-nano.sh 
```
```
./net-juicer-slim.sh
```
```
./net-juicer-speed-test.sh 
```
Net-Juicer Nano is intended for small devices running on a loop using `watch`:
```
watch -c -n 4 /your/dir/here/net-juicer-nano.sh
```
![Nano Demo](https://raw.githubusercontent.com/anthonp/net-juicer/main/NetJuicerNanoDemo.png)
Feel free to download/copy/modify, just let me know! I want to know what you do with it.
Also feel free to add `watch` command example to a script and add it to path and make it one of your regular Linux commands ;)

## I also have a wish list:

- [x] Speed Test (Heavy)
- [x] Netstat
- [x] IP/CIDR/Gateway/Hostname Info
- [x] ICMP Ping Test
- [x] Layer 1 Features (Link Status, LAN Speed, Duplex State, MAC Address)
- [x] Lite Version (No ICMP Ping, Speed Test, or netstat (No callout version)) 
- [ ] CDP/LLDP Implementation for switch ports
- [ ] Captive portal/web detection
- [ ] DNS info/resolution

![Program Demo 1](https://raw.githubusercontent.com/anthonp/net-juicer/main/Program1.png)
![Program Demo 2](https://raw.githubusercontent.com/anthonp/net-juicer/main/Program2.png)
