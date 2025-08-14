# GCP VM via Terraform (VS Code Starter)

## Prereqs
- Terraform >= 1.5
- Google Cloud SDK (`gcloud`)
- VS Code extensions: HashiCorp Terraform, Google Cloud Code (recommended)

## Authenticate to GCP
```bash
gcloud auth application-default login
gcloud config set project YOUR_GCP_PROJECT_ID
```
(This sets Application Default Credentials for Terraform's Google provider.)

## Configure
1. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill your values.
2. Ensure your SSH public key string (the content) is in `ssh_public_key`.

## Run from VS Code
Use the pre-defined tasks (Terminal > Run Task):
- Terraform: Init
- Terraform: Plan
- Terraform: Apply
- Terraform: Destroy

Or use the built-in terminal:
```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply -auto-approve
```

## Save to GitHub (VS Code GUI)
1. Open this folder in VS Code.
2. Click **Source Control** (Ctrl+Shift+G) → **Initialize Repository**.
3. Commit: type a message → **Commit**.
4. Click **Publish Branch** (choose GitHub and repo name) or set remote manually.

### Manual remote (optional)
```bash
git remote add origin git@github.com:<your-username>/vm-gcp-terraform.git
git push -u origin main
```

## Optional: Remote backend on GCS
Create `backend.tf` like:
```hcl
terraform {
  backend "gcs" {
    bucket = "YOUR_TF_STATE_BUCKET"
    prefix = "state/vm"
  }
}
```
Then run:
```bash
terraform init -migrate-state
```
