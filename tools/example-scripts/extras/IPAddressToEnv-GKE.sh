#! /bin/bash
#This example reflects the information in https://neo4j.com/labs/neo4j-helm/1.0.0/externalexposure/#_create_static_ip_addresses_for_inbound_cluster_traffic
for idx in 0 1 2 ; do

   export IP$idx=`gcloud compute addresses describe ${DEPLOYMENT}.neo4j-static-ip-$idx \
      --region=$REGION --project=$PROJECT --format=json | jq -r '.address'`
   export ADDR$idx=`gcloud compute addresses describe ${DEPLOYMENT}.neo4j-static-ip-$idx \
      --region=$REGION --project=$PROJECT --format=json | jq -r '.address'`

done
