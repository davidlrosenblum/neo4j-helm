# Wraps helm install with code to substitute the env variable into the initial yaml
cat $COMMON_SETUP_YAML | envsubst | helm install $DEPLOYMENT . -f -
#cat $COMMON_SETUP_YAML | envsubst > test.yaml