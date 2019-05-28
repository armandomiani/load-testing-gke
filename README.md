# Load Testing on Google Cloud

### Purpose

The purpose of this repository is automating the deployment of a Kubernetes Cluster ready for testing a target application 

The project has been based on this tutorial: 

https://github.com/GoogleCloudPlatform/distributed-load-testing-using-kubernetes


### Ports

* 8089 (Master)
* 5557 (Worker 1) 
* 5558 (Worker 2) 


### Running it 

```
terraform init
terraform apply
```