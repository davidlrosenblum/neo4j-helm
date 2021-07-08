# Wraps helm install with code to substitute the env variable into the initial yaml
# This file will be passed to the heml install command in the next step
cat $COMMON_SETUP_YAML | envsubst > ${DEPLOYMENT}.temp.common-config.yaml
