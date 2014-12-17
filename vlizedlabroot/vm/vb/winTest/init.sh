#!/bin/bash -x
VERSION=2
# PREDEFINED ARE:
# MACHINEDIR= (e.g. /vm/vb/MyMachine)
# MACHINE= (e.g. MyMachine)
VBoxManage --nologo createvm --name $MACHINE --register --basefolder $MACHINEDIR
VBoxManage --nologo modifyvm $MACHINE   --ostype Windows7_64
VBoxManage --nologo modifyvm $MACHINE   --memory 2048
VBoxManage --nologo modifyvm $MACHINE   --vram 128
VBoxManage --nologo modifyvm $MACHINE   --acpi on
VBoxManage --nologo modifyvm $MACHINE   --ioapic on
VBoxManage --nologo modifyvm $MACHINE   --hwvirtex on
VBoxManage --nologo modifyvm $MACHINE   --bioslogofadein off
VBoxManage --nologo modifyvm $MACHINE   --bioslogofadeout off
VBoxManage --nologo modifyvm $MACHINE   --bioslogodisplaytime 1
VBoxManage --nologo modifyvm $MACHINE   --nic1 bridged --bridgeadapter1 eth0
VBoxManage --nologo modifyvm $MACHINE   --nictype1 "82540EM"
VBoxManage --nologo modifyvm $MACHINE   --macaddress1 e0699564f363
#VBoxManage --nologo modifyvm $MACHINE   --nic1 nat
VBoxManage --nologo modifyvm $MACHINE   --audio alsa
VBoxManage --nologo modifyvm $MACHINE   --boot1 dvd
VBoxManage --nologo modifyvm $MACHINE   --usb on
#VBoxManage --nologo modifyvm $MACHINE   --usbehci on

VBoxManage --nologo storagectl    $MACHINE --name C$MACHINE \
        --add ide --controller PIIX4 --hostiocache on
VBoxManage --nologo storageattach $MACHINE --storagectl C$MACHINE \
        --port 0 --device 0 --type hdd \
        --medium $MACHINEDIR/$MACHINE.vdi --mtype normal
VBoxManage --nologo storageattach $MACHINE --storagectl C$MACHINE \
        --port 1 --device 0 --type dvddrive \
        --medium $MACHINEDIR/d.iso
#VBoxManage --nologo storageattach $MACHINE --storagectl C$MACHINE \
#       --port 2 --device 0 --type dvddrive \
#       --medium $MACHINEDIR/VBoxGuestAdditions_4.1.2.iso
