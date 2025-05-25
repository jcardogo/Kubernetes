qm list # to list all VMs
qm start <vmid> # to start a VM
qm stop <vmid> # to stop a VM
qm suspend <vmid> # to suspend a VM
qm resume <vmid> # to resume a VM
qm shutdown <vmid> # to shutdown a VM
qm status <vmid> # to check the status of a VM
qm config <vmid> # to get the configuration of a VM
qm set <vmid> --memory <size> # to set memory for a VM
qm set <vmid> --cores <number> # to set CPU cores for a VM  
qm set <vmid> --net0 virtio,bridge=vmbr0 # to set network for a VM
qm set <vmid> --ide2 local-lvm:cloudinit # to set cloud-init for a VM
qm set <vmid> --scsi0 local-lvm:32 # to set disk size for a VM
qm set <vmid> --ipconfig0 ip=dhcp # to set DHCP for a VM