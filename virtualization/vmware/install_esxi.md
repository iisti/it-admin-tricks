# Install ESXi
* Enable all network links in DCUI (if multiple NICs)
* Enable ESXi SSH and Shell in DCUI
* Set hostname in shell
  * esxcli system hostname set --host=hostname
  * Source: https://kb.vmware.com/s/article/1010821   
* In WebGUI
  * Assing license
  * Add another uplink in vSwitch
  * Enable SSH in firewall (in and out)
