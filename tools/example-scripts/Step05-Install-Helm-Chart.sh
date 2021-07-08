# This example is based on the docs https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/#_per_host_configuration
# Wraps helm install with code to substitute the env variable into the initial yaml
helm install $DEPLOYMENT . -f ${DEPLOYMENT}.temp.common-config.yaml
#cat $COMMON_SETUP_YAML | envsubst > test.yaml
