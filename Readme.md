# Scalable Jenkins on a Kubernetes Cluster.

## Overview
### Jenkins Scalability

Scalability is a measure that shows the ability of a system to expand its capabilities to handle an additional load. One of the strongest sides of Jenkins is that it has a scaling feature almost out-of-the-box. Jenkins scaling is based on the master/slaves model, where you have a number of agent instances (called slaves) and one main Jenkins instance (called master), which is responsible mainly for distributing jobs across slaves.

#### Jenkins scalability gives you lots of benefits:

- The ability to run many more build plans in parallel.
* Automatically replacing corrupted Jenkins instances.
* Automatically spinning up and removing slaves based on need, which saves costs.


## How to run
### Prerequisites
- Running kubernetes cluster (to deploy kubernetes cluster you can use [Kubespray](https://github.com/kubernetes-incubator/kubespray.git)
- Kubectl configured to perform deployment tasks


### Deployment guide
1. Clone this repo:

`git clone http://192.168.103.236:3000/vasa/Kubernetes.git`

2. Create persistant volume:

A PersistentVolume (PV) is a piece of storage in the cluster that Jenkins is allow to use.

`kubectl create  k8s_persistent_volume.yml`

`Persistentvolume jenkins-home1 created`
