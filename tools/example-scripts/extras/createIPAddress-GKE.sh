. ./scripts/deployment.sh
for idx in 0 1 2 ; do
   gcloud compute addresses create \
      neo4j-static-ip-$idx --project=$PROJECT \
      --network-tier=PREMIUM --region=$REGION

    export IP$idx=`gcloud compute addresses describe neo4j-static-ip-$idx \
      --region=$REGION --project=$PROJECT --format=json | jq -r '.address'`
    export ADDR$idx=`gcloud compute addresses describe neo4j-static-ip-$idx \
      --region=$REGION --project=$PROJECT --format=json | jq -r '.address'`
done
