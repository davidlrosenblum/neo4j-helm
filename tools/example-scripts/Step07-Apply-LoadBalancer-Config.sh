#This example is based on the docs at https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/#_external_exposure
# Reuse IP0, etc. from the earlier step here.
# These *must be IP addresses* and not hostnames, because we're
# assigning load balancer IP addresses to bind to.
if [ $STANDALONE == "false" ]
then
	export CORE_ADDRESSES=($IP0 $IP1 $IP2)

	for x in 0 1 2 ; do
		   export IDX=$x
		   export IP=${CORE_ADDRESSES[$x]}
		   echo $DEPLOYMENT with IDX $IDX and IP $IP ;
		   kubectl apply -f ${DEPLOYMENT}.core-${IDX}.loadblancer.yaml
	done
else
	# standalone - only one core server
	export IDX=0
	export IP=$IP0
	echo $DEPLOYMENT with IDX $IDX and IP $IP ;
	kubectl apply -f ${DEPLOYMENT}.core-${IDX}.loadblancer.yaml
fi
