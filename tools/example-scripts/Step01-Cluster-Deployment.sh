#This example is based on content from https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/
#Source this file to create the settings for a sample 3 node neo4j cluster
#Minimal differences between deploymentStandalone.sh and deploymentCluster.sh
export REGION=us-central1
export PROJECT=neo4j-se-team-201905
export DEPLOYMENT=neocluster
# the common config has the basic settings - generally from https://neo4j.com/labs/neo4j-helm/1.0.0/configreference/
export COMMON_SETUP_YAML=scripts/config/cluster-common-config.yaml
# the custom config has the over-rides to the NEO4J Docker settings that can't be done as common config
# And all the per pod/server configurations - e.g. unique IP address to advertise, etc.
export CUSTOM_SETUP_YAML=scripts/config/cluster-custom-config.yaml
# The load balancer provides the advertised address outside of the GKE cluster to route things
export LOAD_BALANCER_SETUP_YAML=scripts/config/load-balancer.yaml
#for a cluster STANDALONE = false
export STANDALONE=false
export CORE_SERVER_COUNT=3
export CORE_DISK_SIZE=1000Gi
# The CORE_STORAGE_CLASS is a GKE only setting - comment it out if running elsewhere or you aren't sure.
# Other providers are listed https://kubernetes.io/docs/concepts/storage/storage-classes/
# An example storage class YAML is in scripts/config/xfsStorageClassGKE.yaml
export CORE_STORAGE_CLASS=premium-rwo
export RESOURCE_REQUEST=2G
export RESOURCE_LIMIT=2G
export MEM_INITIAL_SIZE=1G
export MEM_MAX_SIZE=1G
export MEM_PAGECACHE=512M
export MEM_USE_MEMREC=FALSE
#This initial password is set when the the PVC is created.
#If you re-use a PVC - it will have the database and passwords from the prior invocation
export INITIAL_PASSWORD=mySecretPassword
#If you can't reach github and other internet resources you will need to set plugins to "[]" and
#setup manually with initContainer
export PLUGINS=\"[]\"
export ACCEPT_LICENSE_AGREEMENT=\"yes\"
#custom config items below
export dbms_security_procedures_unrestricted=\"apoc.*\"
export HTTP_PORT=7474
export HTTPS_PORT=7473
export BOLT_PORT=7687
export BACKUP_PORT=6362
#These are the addresses that Neo4j will route to - they can be manually created static IP  - or they can be generated
#See https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/#_create_static_ip_addresses_for_inbound_cluster_traffic
#you will need as many IP addresses as you will have pods. For a standalone - just one is all you need.
#This is a 4.2.x setup
#Note for 4.3.x helm charts when they become available you can use SSR and one IP address even for a cluster of  Neo4j servers.
export IP0=<IP0 ADDRESS GOES HERE>
export IP1=<IP1 ADDRESS GOES HERE>
export IP2=<IP2 ADDRESS GOES HERE>
#if you are going to use SSL these address should be DNS names that match the cert(s)
#IP addresses will work for a PoC or a quick trial.
export ADDR0=<IP0 or DNS for IP 0 ADDRESS GOES HERE>
export ADDR1=<IP1 or DNS ror IP 1 ADDRESS GOES HERE>
export ADDR2=<IP2 or DNS for IP 2 ADDRESS GOES HERE>
