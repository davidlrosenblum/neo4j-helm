# This example is based on the docs https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/#_per_host_configuration
# Wraps helm install with code to substitute the env variable into the initial yaml
# This file will be passed to the heml install command in the next step
cat $COMMON_SETUP_YAML | envsubst > ${DEPLOYMENT}.temp.common-config.yaml
