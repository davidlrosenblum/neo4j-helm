
# This script will substitute ADDR0..n, PORTS.  
# The custom configuration should be run before the helmInstall.sh is run
# This configmap is "${DEPLOYMENT}-neo4j-externally-addressable-config" and 
# is referenced by configMap in xxxxx-common-config.yaml 

	   cat $CUSTOM_SETUP_YAML | envsubst | kubectl apply -f -

