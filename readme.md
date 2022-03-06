you'll need the name of the project in your GCP account. You can create one from the shell:
```bash
gcloud projects create fuck-russia$RANDOM
```
You'll see the id for the multiple times in the output. If you missed it than you can find it by running the following:
```bash
gcloud projects list
```
Next create the iam service account and add the policies for it:
```bash
export project_id=....
gcloud iam service-accounts create fuck-russia
gcloud projects add-iam-policy-binding ${project_id} --member="serviceAccount:fuck-russia@${project_id}.iam.gserviceaccount.com" --role=roles/cloudjobdiscovery.admin
gcloud projects add-iam-policy-binding ${project_id} --member="serviceAccount:fuck-russia@${project_id}.iam.gserviceaccount.com" --role=roles/compute.admin
```
grab the keys:
```bash
gcloud iam service-accounts keys create fuck-russia.json --iam-account=fuck-russia@${project_id}.iam.gserviceaccount.com
```

Create env var to authorize in GCP:
```bash
export GOOGLE_APPLICATION_CREDENTIALS=./fuck-russia.json
```

Next you can run the `terraform apply`