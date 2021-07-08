# Wraps helm install with code to substitute the env variable into the initial yaml
helm install $DEPLOYMENT . -f ${DEPLOYMENT}.temp.common-config.yaml
#cat $COMMON_SETUP_YAML | envsubst > test.yaml
