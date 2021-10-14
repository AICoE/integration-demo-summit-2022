# Microshift (uShift) Staging

The directory `manifests` currently contains two files:

- Microshift device on Kubevirt: Microshift is going to run on a RHEL for Edge Kubevirt VM. This manifest will grab a customized ISO and perform the installation process. Then, it will grab the device configuration from a git repo specified in `/etc/transmission-url`. 
- Jumphost pod to ssh: This pod is created to be able to ssh into all of the devices located in the pod network.
