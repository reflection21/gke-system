gcloud services enable iam.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable iap
gcloud services enable kubernetes cluster

 ### connect to bastion-host
gcloud compute ssh bastion-host \
  --project my-system-474719 \
  --zone europe-north2-a \
  --tunnel-through-iap

### install kubectl on bastion host
gcloud components install kubectl

### install plugin
sudo apt-get install google-cloud-cli-gke-gcloud-auth-plugin git kubectl -y

### create kubeconfig
gcloud container clusters get-credentials k8s-k8s-cluster --region europe-north2 --project my-system-474719

### install terraform 
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform

### install terragrunt
sudo wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.90.0/terragrunt_linux_amd64 \
  -O /usr/local/bin/terragrunt

sudo chmod +x /usr/local/bin/terragrunt

### clone gitlab repo
ssh-keygen -t ed25519

eval $(ssh-agent -s)

ssh-add  ~/.ssh/gitlab

git clone git@gitlab.com:reflection21/gke_system.git