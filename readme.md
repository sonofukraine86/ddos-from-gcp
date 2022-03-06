you'll need the name of the project in your GCP account. It is strongly recommended to create it from the GCP console.

You'll see the id for the multiple times in the output. If you missed it than you can find it by running the following:
```bash
gcloud projects list
```
Next create the iam service account and add the policies for it:
```bash
export GOOGLE_PROJECT=...
gcloud iam service-accounts create fuck-russia
gcloud projects add-iam-policy-binding ${GOOGLE_PROJECT} --member="serviceAccount:fuck-russia@${GOOGLE_PROJECT}.iam.gserviceaccount.com" --role=roles/cloudjobdiscovery.admin
gcloud projects add-iam-policy-binding ${GOOGLE_PROJECT} --member="serviceAccount:fuck-russia@${GOOGLE_PROJECT}.iam.gserviceaccount.com" --role=roles/compute.admin
```
grab the keys:
```bash
gcloud iam service-accounts keys create fuck-russia.json --iam-account=fuck-russia@${GOOGLE_PROJECT}.iam.gserviceaccount.com
```

Create env var to authorize in GCP:
```bash
export GOOGLE_APPLICATION_CREDENTIALS=./fuck-russia.json
```

Next you can run the
```bash
terraform apply -auto-approve -target="random_shuffle.zone"
terraform apply -auto-approve -target="random_shuffle.region"
terraform apply -auto-approve```