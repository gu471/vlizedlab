import os
import time
import commands

os.system("VBoxManage list usbhost | grep 'UUID:' > /tmp/usb.tmp")

time.sleep(5)

while commands.getoutput('pgrep VirtualBox') == "":
	time.sleep(5)

f = open("/tmp/usb.tmp")

for line in f.readlines():
	line =	line.strip('UUID:')
	line =	line.strip('Address:')
	line = line.strip(' ')
	line = line.strip('\n')
	print line
	os.system("VBoxManage controlvm autostart usbattach " + line)
