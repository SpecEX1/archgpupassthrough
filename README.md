GRUB SPECIFIC!
Enable IOMMU 1st
$ editor /etc/default/grub
Add intel_iommu=on to GRUB_CMDLINE_LINUX_DEFAULT="..."
If you have an intel cpu
Regenerate your grub cfg
grub-mkconfig -o /boot/grub/grub.cfg
then reboot

Run vfio.sh to see device ids
you should get something like this
IOMMU Group 13:
	06:00.0 VGA compatible controller: NVIDIA Corporation GM204 [GeForce GTX 970] [10de:13c2] (rev a1)
	06:00.1 Audio device: NVIDIA Corporation GM204 High Definition Audio Controller [10de:0fbb] (rev a1) 
  Note down the ids for this example it would be 10de:13c2 and 10de:0fbb
  
  run passthrough.sh
  first editor prompt add 
  vfio-pci.ids=10de:13c2,10de:0fbb
  make sure the ids are for your specific gpu you want to pass through
  in the second editor prompt find 
  MODULES=() and add
  vfio_pci vfio vfio_iommu_type1 vfio_virqfd
  inside the parenthesis
  in the third editor prompt add
  modules_force_load: vfio_pci,vfio,vfio_iommu_type1,vfio_virqfd
  
  and now you should be good to pass your gpu through to a virtual machine
  
  this is still very much a work in progress script, but i will get it eventually if it's not right currently
