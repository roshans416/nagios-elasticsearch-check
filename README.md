# TASKS

## Task1 Nagios-ElasticSearch

`check_elasticsearch.sh` : Nagios check script can be found under "**task1-nagios-elasticsearch**" directory.

1) Copy the script under **/usr/local/nagios/libexec/** directory.
2) Modify the commands.cfg

```
define command {
     command_name    check_elasticsearch
     command_line    $USER1$/check_elasticsearch.sh $ARG1$ $ARG2$
}
```
3) Modify the localhost.cfg file

```
#Check for a pattern in elasticsearch cluster

define service {

  use                      local-service
  host_name                 localhost
  service_description      ELASTICSEARCH
  check_command            check_elasticsearch!"Handbill not printed"!192.168.94.104

}
```
Replace 192.168.94.104 with your ElasticSearch IP.

## Kubernetes Task

### PRE-REQUISITES

1. `Kubectl` : Install **kubectl** CLI
2. `Minikube or any other Kubernetes clusters` : 

To install Minikube, 

**Linux**
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
```

**Mac**
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
  && chmod +x minikube
```

## DEPLOY SPRING-BOOT APP AND MYSQL TO KUBERNETES

**Execute the following script**
```
./deploy-spring-boot.sh
```

### CONFIGURATION DETAILS
1. Created a Docker Image for the spring boot app and uploaded that to Docker hub. `roshans416/spring-boot-so1
2. Created 2 replicas of Spring boot app
3. Enabled Readiness and Liveness Checks
4. Exposed the application using a Service definition.


## Additional information: Task 3, Requirement 6

### Enable CI for the current setup

*Recommendation: Enable Skaffold local CI setup*

**Features**

1. `Automated builds` - Changes in local files will trigger  a build. 
2. `Supported build strategies` - Dockerfile, Jib, Kaniko etc
3. `Deployment` - Using Helm or Kubectl
 
For more info, please refer [Skaffold documentation](https://github.com/GoogleContainerTools/skaffold)
