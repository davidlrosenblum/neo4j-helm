#! /bin/bash
. ./scripts/deployment.sh
for idx in 0 1 2 ; do

   export IP$idx=`gcloud compute addresses describe neo4j-static-ip-$idx \
      --region=$REGION --project=$PROJECT --format=json | jq -r '.address'`
   export ADDR$idx=`gcloud compute addresses describe neo4j-static-ip-$idx \
      --region=$REGION --project=$PROJECT --format=json | jq -r '.address'`
   
done
