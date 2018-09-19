# Scalable Jenkins on a Kubernetes Cluster.

## Overview
### Jenkins Scalability

Scalability is a measure that shows the ability of a system to expand its capabilities to handle an additional load. One of the strongest sides of Jenkins is that it has a scaling feature almost out-of-the-box. Jenkins scaling is based on the master/slaves model, where you have a number of agent instances (called slaves) and one main Jenkins instance (called master), which is responsible mainly for distributing jobs across slaves.

#### Jenkins scalability gives you lots of benefits:

- The ability to run more build plans in parallel.
* Automatically replacing corrupted Jenkins instances.
* Automatically spinning up and removing slaves based on need, which saves costs.


## How to run
### Prerequisites
- Running kubernetes cluster (to deploy kubernetes cluster you can use [Kubespray](https://github.com/kubernetes-incubator/kubespray.git))
- Kubectl configured to perform deployment tasks


### Deployment guide

1.Clone this repo:

`git clone http://192.168.103.236:3000/vasa/Kubernetes.git`

2.Create persistent volume:

PersistentVolume  is a piece of storage in the cluster that Jenkins is allow to use.

`kubectl create  k8s_persistent_volume.yml`

`Persistentvolume jenkins-home1 created`

3.Create persistant volume claim:
 
 PersistentVolumeClaim  is a request for storage by a user.
 
 `kubectl create  k8s_persistent_volume_claim.yml`
 
 `PersistentVolumeClaim jenkins-home-pvc1 created`
 
4.Run Jenkins master deployment:
 
 `kubectl create  k8s_jenkins_deployment.yml`
 
 `Deployment Jenkins created`
 
5.Expose Jenkins service:

`kubectl create  k8s_jenkins_service.yml`

`Service Jenkins created`

```
kubectl describe service jenkins

Name:                     jenkins
Namespace:                default
Labels:                   <none>
Annotations:              kubectl.kubernetes.io
selector:                 app=jenkins
Type:                     NodePort
IP:                       10.233.15.208
Port:                     port-1  8080/TCP
TargetPort:               8080/TCP
NodePort:                 port-1  30231/TCP
Endpoints:                10.233.102.166:8080
Port:                     port-2  50000/TCP
TargetPort:               50000/TCP
NodePort:                 port-2  30456/TCP
Endpoints:                10.233.102.166:50000
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
```



Now you can access to your Jenkins page via browser,go to Node_ip:30231

![alt text](https://cdn2.hubspot.net/hubfs/208250/Blog_Images/scalablejenkins12.png)


6.Install and configure Kubernetes plugin:

Navigate to "Manage Jenkins -> Manage plugins -> Aviable" find Kubernetes and install it.
Next go to "Manage Jenkins -> Configure System -> Cloud -> Kubernetes" and fill 'Kubernetes URL','Jenkins URL' and 'Jenkins tunnel' appropriately to your conditions.

![alt text](https://dzone.com/storage/temp/8389797-scalablejenkins13.png)

Now you can use Kubernetes cluster as jenkins-slave.You need to specify pod template in your pipeline scripts.

```
def label = "mypod-${UUID.randomUUID().toString()}"
podTemplate(label: label) {
  node(label) {
    stage('Run shell') {
      container('mycontainer') {
        sh 'echo hello world'
      }
    }

```

More information of how to use Kubernetes plugin you can find [here]( https://github.com/jenkinsci/kubernetes-plugin)
