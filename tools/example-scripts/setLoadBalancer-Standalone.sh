
# Reuse IP0, etc. from the earlier step here.
# These *must be IP addresses* and not hostnames, because we're
# assigning load balancer IP addresses to bind to.
# This is the cluster example - so it uses 3 IP addresses
export CORE_ADDRESSES=($IP0 $IP1 $IP2)

for x in 0  ; do
	   export IDX=$x
	   export IP=${CORE_ADDRESSES[$x]}
	   echo $DEPLOYMENT with IDX $IDX and IP $IP ;

	   cat $LOAD_BALANCER_SETUP_YAML | envsubst | kubectl apply -f -
done
