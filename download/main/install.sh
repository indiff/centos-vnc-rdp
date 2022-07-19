#!/bin/bash

echo "---------------------------------------------------------------------------------------------------------------------"
echo "Welcome to Desktop environment and Remote connection tool ! V1.0.0"
echo "System requirements: CentOS 7+ New installation"
echo "Recommended system : [Original] Network one-click Reinstall CentOS 7 (Official, Pure, Safe, Efficient)"
echo "URL : https://tech.cxthhhhh.com/linux/2018/07/30/original-network-one-click-reinstall-centos-7-official-pure-safe-efficient-en.html"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "from https://tech.cxthhhhh.com - 2018/08/07 - MeowLove"
echo "---------------------------------------------------------------------------------------------------------------------"
echo Press any key to continue! Exit with 'Ctrl'+'C' !

echo -e "\n"
sudo cd /root
yum install epel-release -y
echo "Start creating Swaps Memory, please wait..."
dd if=/dev/zero of=/var/swapd bs=1024 count=3145728
mkswap /var/swapd
chmod 0644 /var/swapd
swapon /var/swapd
echo '/var/swapd   swap   swap   default 0 0' >> /etc/fstab
echo "---------------------------------------------------------------------------------------------------------------------"
echo "交换内存创建 [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n"
sudo cd /root
yum groupinstall "X Window System" -y
yum groupinstall "MATE Desktop" -y
yum groupinstall "Chinese support" -y
yum groups mark install "Chinese support" -y
yum install cjkuni-ukai-fonts cjkuni-uming-fonts -y
yum install fontforge -y
yum install ibus-libpinyin im-chooser -y
localectl set-locale LANG=zh_CN.UTF8
echo "---------------------------------------------------------------------------------------------------------------------"
echo "桌面环境 [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n"
sudo cd /root
touch /etc/yum.repos.d/google-chrome.repo
echo '[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub'>/etc/yum.repos.d/google-chrome.repo
echo -e "\n"
cat /etc/yum.repos.d/google-chrome.repo
yum install google-chrome-stable -y
echo "---------------------------------------------------------------------------------------------------------------------"
echo "谷歌浏览器 [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n"
sudo cd /root
rpm -Uvh --force https://raw.githubusercontent.com/indiff/centos-vnc-rdp/master/download/nux-dextop/nux-dextop-release-0-5.el7.nux.noarch.rpm --quiet
yum install remmina remmina-plugins-* -y
echo "---------------------------------------------------------------------------------------------------------------------"
echo "The nux-dextop-release Already installed  is [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

# echo -e "\n"
# sudo cd /root
# rpm -Uvh --force https://raw.githubusercontent.com/indiff/centos-vnc-rdp/master/download/wine/wine32-release.rpm --quiet
# yum install wine.i686 -y
# yum install wine -y
# sudo wget -O /usr/share/wine/fonts/msyh.ttc https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/msyh.ttc
# sudo wget -O /usr/share/wine/fonts/msyhbd.ttc https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/msyhbd.ttc
# sudo wget -O /usr/share/wine/fonts/msyhl.ttc https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/msyhl.ttc
# sudo wget -O /usr/share/wine/fonts/simfang.ttf https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/simfang.ttf
# sudo wget -O /usr/share/wine/fonts/simhei.ttf https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/simhei.ttf
# sudo wget -O /usr/share/wine/fonts/simkai.ttf https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/simkai.ttf
# sudo wget -O /usr/share/wine/fonts/SIMLI.ttf https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/SIMLI.ttf
# sudo wget -O /usr/share/wine/fonts/simsun.ttc https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/simsun.ttc
# sudo wget -O /usr/share/wine/fonts/SIMYOU.ttf https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/SIMYOU.ttf
# sudo wget -O /usr/share/wine/fonts/仿宋_GB2312.ttf https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/仿宋_GB2312.ttf
# sudo wget -O /usr/share/wine/fonts/楷体_GB2312.ttf https://raw.githubusercontent.com/MeowLove/CentOS-One-click-Installation-of-Desktop-Environment-and-Remote-Desktop-Connection-RDP/master/download/ttf/楷体_GB2312.ttf
# echo "---------------------------------------------------------------------------------------------------------------------"
# echo "The Wine Already installed  is [OK]"
# echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n"
sudo cd /root
yum install tigervnc-server tigervnc -y
yum install xrdp -y
touch ~/.Xclients
echo "mate-session" > ~/.Xclients
chmod a+x ~/.Xclients
systemctl enable xrdp
systemctl start xrdp
firewall-cmd --add-port=3389/tcp --permanent
firewall-cmd --reload
echo "---------------------------------------------------------------------------------------------------------------------"
echo "远程连接 RDP 已安装 [OK]"
echo "---------------------------------------------------------------------------------------------------------------------"

echo -e "\n\n\n"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "The current default system language is Chinese."
echo "If you are an English user, please execute ' sudo localectl set-locale LANG=en_US.UTF-8 '"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "Warning: Now, you need to pay attention to the following, please visit this page."
echo "[Original] One-click installation of Desktop environment, RDP, Windows support for Linux"
echo "https://tech.cxthhhhh.com/linux/2018/08/07/original-one-click-installation-of-desktop-environment-rdp-windows-support-for-linux-en.html"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "End to Desktop environment and Remote connection tool ! V1.0.0"
echo "Everything is ready and the system is restarting. Then you can connect via (RDP)IP:3389."
echo "---------------------------------------------------------------------------------------------------------------------"
echo "from https://tech.cxthhhhh.com - 2018/08/07 - MeowLove"
echo "---------------------------------------------------------------------------------------------------------------------"
reboot
echo -e "\n"
