# Deployment instructions for balena
 
Deploy to balena: ```balena push <YOUR_DEVICE>```

## Overview

This project contains example containers to showcase udev handling in balenaOS.
For more information please refer to [this post]().

| Container  | Description |
| ------------- | ------------- |
| udev-default  | Default: ```UDEV=off``` and ```privileged: false```  |
| udev-enabled  | ```UDEV=on``` and ```privileged: true```  |
| udev-rule-hello-world  | udev-enabled with udev rule that prints to log.  |
| usb-copy  | Full example. Files copied when USB plugged. |
