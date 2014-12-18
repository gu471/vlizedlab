#!/bin/bash -x

VERSION=2

echo "starting MACHINE >$MACHINE< in >$MACHINEDIR<"

VBoxManage --nologo createvm --name $MACHINE --register --basefolder $MACHINEDIR

# VBoxManage --nologo modifyvm $MACHINE 	--ostype linux26
VBoxManage --nologo modifyvm $MACHINE 	--memory 750
VBoxManage --nologo modifyvm $MACHINE 	--vram 128
VBoxManage --nologo modifyvm $MACHINE 	--acpi on
VBoxManage --nologo modifyvm $MACHINE 	--ioapic on
VBoxManage --nologo modifyvm $MACHINE 	--hwvirtex on
VBoxManage --nologo modifyvm $MACHINE 	--bioslogofadein off
VBoxManage --nologo modifyvm $MACHINE 	--bioslogofadeout off
VBoxManage --nologo modifyvm $MACHINE 	--bioslogodisplaytime 1
VBoxManage --nologo modifyvm $MACHINE 	--nic1 nat
VBoxManage --nologo modifyvm $MACHINE 	--audio alsa

VBoxManage --nologo modifyvm $MACHINE 	--accelerate2dvideo on
# Turn this off by default:
# VBoxManage --nologo modifyvm $MACHINE 	--accelerate3d on

if [ -f $MACHINEDIR/init.add.sh ]; then
    source $MACHINEDIR/init.add.sh
fi

VBoxManage --nologo sharedfolder add $MACHINE  --name media --hostpath /media --automount

VBoxManage --nologo storagectl    $MACHINE --name C$MACHINE --add ide --controller PIIX4 --hostiocache on
VBoxManage --nologo storageattach $MACHINE --storagectl C$MACHINE --port 1 --device 0 \
      --type hdd --medium $MACHINEDIR/$MACHINE.vdi --mtype immutable


