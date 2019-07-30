#!/bin/bash

echo "--- udev-plug-usb rule triggered ---" >> /home/usb-copy.log
echo "$(date) $(ls -1 | wc -l)" >> /home/usb-copy.log
echo "Serial id is $ID_SERIAL" >> /home/usb-copy.log
echo "Usec id is $USEC_INITIALIZED" >> /home/usb-copy.log
echo "Vendor id is $ID_VENDOR" >> /home/usb-copy.log
echo "File system type $ID_FS_TYPE" >> /home/usb-copy.log

# Mount device
if findmnt -rno SOURCE,TARGET $DEVNAME >/dev/null; then
    echo "Device $DEVNAME is already mounted!" >> /home/usb-copy.log
else
    echo "Mounting device: $DEVNAME" >> /home/usb-copy.log
    echo "Mounting destination: /mnt/storage-$USEC_INITIALIZED" >> /home/usb-copy.log    
    mkdir -p /mnt/storage-$USEC_INITIALIZED >> /home/usb-copy.log
    mount -t $ID_FS_TYPE -o rw $DEVNAME /mnt/storage-$USEC_INITIALIZED >> /home/usb-copy.log
fi

# Sync files
echo "Sync: /mnt/storage-$USEC_INITIALIZED" >> /home/usb-copy.log
rsync -a --delete /mnt/storage-$USEC_INITIALIZED/ /usbstorage

# Unmount device
if findmnt -rno SOURCE,TARGET $DEVNAME >/dev/null; then
    echo "Unmounting device: $DEVNAME" >> /home/usb-copy.log
    unmount -f $DEVNAME
else
    echo "No deviced named $DEVNAME was found." >> /home/usb-copy.log
fi