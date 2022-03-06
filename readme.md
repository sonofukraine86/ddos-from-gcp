gcloud iam service-accounts create terraform-account
gcloud projects add-iam-policy-binding pelagic-fin-334611 --member="serviceAccount:terraform-account@pelagic-fin-334611.iam.gserviceaccount.com" --role=roles/cloudjobdiscovery.admin
gcloud projects add-iam-policy-binding pelagic-fin-334611 --member="serviceAccount:terraform-account@pelagic-fin-334611.iam.gserviceaccount.com" --role=roles/compute.admin
gcloud iam service-accounts keys create terraform-account.json --iam-account=terraform-account@pelagic-fin-334611.iam.gserviceaccount.com

export GOOGLE_APPLICATION_CREDENTIALS=./terraform-account.json