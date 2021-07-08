# This example is based on the docs https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/#_per_host_configuration
# This script will substitute ADDR0..n, PORTS.
# The custom configuration should be run before the helmInstall.sh is run
# This configmap is "${DEPLOYMENT}-neo4j-externally-addressable-config" and
# is referenced by configMap in xxxxx-common-config.yaml

	   cat $CUSTOM_SETUP_YAML | envsubst > ${DEPLOYMENT}.temp.custom-config.YAML
