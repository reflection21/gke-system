gcloud services enable iam.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iap
gcloud services enable kubernetes cluster


 ### connect to bastion-host
iap connect to aip proxy (Identity-Aware Proxy )
gcloud compute ssh bastion-host \
  --project my-system-474719 \
  --zone europe-north2-a \
  --tunnel-through-iap


### install kubectl on bastion host

gcloud components install kubectl


### install plugin

sudo apt-get install google-cloud-cli-gke-gcloud-auth-plugin


### create kubeconfig

gcloud container clusters get-credentials k8s-k8s-cluster --region europe-north2 --project my-system-474719


### install argo into kube

kubectl create namespace argocd

