find / -name "*" | xargs grep -i "text_pattern"

http://www.vlizedlab.at/installation.html

http://download.virtualbox.org/virtualbox/4.1.12/Oracle_VM_VirtualBox_Extension_Pack-4.1.12-77245.vbox-extpack #ExtensionPack for USB 2.0
VBoxManage extpack install <file>
usermod student -G vboxusers 	# USB weiterreichen

https://wiki.debian.org/iwlwifi

apt-get install wireless-tools rfkill wpasupplicant

rfkill unblock wlan0		# WLAN aktivieren

chmod 600 /etc/network/interfaces
