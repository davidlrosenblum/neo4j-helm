# Neo4j-Helm Example Scripts

This directory has sample scripts that are based on the External Exposure chapter in the docs. Read the Documentation Chapter on External Exposure.  Really.
This particular example is Google GKE centric, but all the steps end up being quite similar.

[External Exposure Documentation can be found here](https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/)

### Common Steps and Assumptions

You already have the IP address(s) external to your K8 cluster for the load balancer(s).  Look in the extras folder for samples of how to create the IP addresses.  If you are running in a VPC or Enterprise environment, this is _not_ a recommendation on how to do it.  Let an admin create the IP in the correct sub-net.

Many would also suggest the settings that we abstracted out to Step01-Deployment.sh should be set in values.yaml.  Please take this as an example of how to over-ride things in that file.

We are showing that an initContainer can be used to pick up jar files and place in your pod instead of the standard Neo4j Docker env variable(s).

[Docker Operations Manual](https://neo4j.com/docs/operations-manual/current/docker/configuration/#docker-neo4j-configuration)

Log into your Cloud provider (e.g. gcloud auth list)

Set your project

Set with cluster you will use

``` bash
Google: gcloud container clusters get-credentials <cluster-name> --zone <zone> --project <project>
Azure: az aks get-credentials --resource-group k8grp --name myk8cluster
AWS: aws eks --region region update-kubeconfig --name cluster_name
```

Clone the repo and switch to the example-scripts branch

```bash
  git clone https://github.com/davidlrosenblum/neo4j-helm.git
  cd neo4j-helm
  git checkout example-scripts
```



### Standalone (single server) setup

Examine and edit Step01-Deployment.sh 

```bash
export REGION=<your region>
export PROJECT=<your project>
export IP0=<IP0>
export ADDR0=<IP0 or DNS for IP0>
export STANDALONE=true
```

Optionally you can change the deployment name

```
export DEPLOYMENT=mydeploymentname
```

Save Step01-Deployment.sh and make sure you are in the neo4j-helm directory to run the steps.  

```bash
. ./tools/example-scripts/Step01-Deployment.sh #Source the env vars
./tools/example-scripts/Step02-Create-Custom-Config.sh #Create custom configmap 
./tools/example-scripts/Step03-Apply-Custom-Config.sh #kubectl apply the custom configmap
./tools/example-scripts/Step04-Create-Common-Config.sh #create common configmap
./tools/example-scripts/Step05-Install-Helm-Chart.sh #install the helm chart using common
```

At this point you should examine Workloads, Configuration and Storage to see if all is well, or perform some kubectl commands - some are listed on the console when the helm chart runs.

The remaining steps establish the networking between the running Neo4j Server in the pod.

```bash
./tools/example-scripts/Step06-Create-LoadBalancer-Config.sh #create the config
./tools/example-scripts/Step07-Apply-LoadBalancer-Config.sh #kubectl apply the config
```

If there were no errors, Neo4j should now be running at http://<IP0>:7474 - give it a few minutes for the Load Balancer networking to establish itself.



### Cluster (three neo4j servers clustered) setup

Uninstall the standalone if you have tried that.

```bash
helm uninstall $DEPLOYMENT
```

Examine and edit Step01-Deployment.sh - setting STANDALONE=false is the key to getting a cluster

```bash
export REGION=<your region>
export PROJECT=<your project>
export STANDALONE=false
export IP0=<IP0>
export ADDR0=<IP0 or DNS for IP0>
export IP1=<IP1>
export ADDR0=<IP1 or DNS for IP1>
export IP2=<IP2>
export ADDR0=<IP2 or DNS for IP2>
```

Optionally you can change the deployment name

```bash
export DEPLOYMENT=mydeploymentcluster
```

Save Step01-Deployment.sh and make sure you are in the neo4j-helm directory to run the steps.  

```bash
. ./tools/example-scripts/Step01-Deployment.sh #Source the env vars
./tools/example-scripts/Step02-Create-Custom-Config.sh #Create custom configmap 
./tools/example-scripts/Step03-Apply-Custom-Config.sh #kubectl apply the custom configmap
./tools/example-scripts/Step04-Create-Common-Config.sh #create common configmap
./tools/example-scripts/Step05-Install-Helm-Chart.sh #install the helm chart using common
```

At this point you should examine Workloads, Configuration and Storage to see if all is well, or perform some kubectl commands - some are listed on the console when the helm chart runs.

The remaining steps establish the networking between the running Neo4j Server in the pod.

```bash
./tools/example-scripts/Step06-Create-LoadBalancer-Config.sh #create the config
./tools/example-scripts/Step07-Apply-LoadBalancer-Config.sh #kubectl apply the config
```

If there were no errors, Neo4j should now be running at http://<IP0>:7474 - give it a few minutes for the Load Balancer networking to establish itself.









