you'll need the name of the project in your GCP account
Next create the iam service account and add the policies for it:
```bash
gcloud iam service-accounts create fuck-russian
gcloud projects add-iam-policy-binding pelagic-fin-334611 --member="serviceAccount:fuck-russian@pelagic-fin-334611.iam.gserviceaccount.com" --role=roles/cloudjobdiscovery.admin
gcloud projects add-iam-policy-binding pelagic-fin-334611 --member="serviceAccount:fuck-russian@pelagic-fin-334611.iam.gserviceaccount.com" --role=roles/compute.admin
```
grab the keys:
```bash
gcloud iam service-accounts keys create fuck-russian.json --iam-account=fuck-russian@pelagic-fin-334611.iam.gserviceaccount.com
```

Create env var to authorize in GCP:
```bash
export GOOGLE_APPLICATION_CREDENTIALS=./fuck-russian.json
```

Next you can run the `terraform apply`