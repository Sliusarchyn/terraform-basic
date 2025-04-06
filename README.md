# 🌍 Terraform Basic Template

A clean and simple Terraform setup with support for **multi-environment infrastructure** management (e.g., `dev`, `prod`). This project uses `terraform.tfvars` and a handy `Makefile` to streamline everyday Terraform commands.

---

## 🌐 Provider-Specific Examples

Specific examples for cloud providers and CI/CD platforms will be pushed to separate branches:

- [Google Cloud Platform (GCP)](https://github.com/Sliusarchyn/terraform-basic/tree/gcp-example)
- GitLab
- Bitbucket
- DigitalOcean
- Cloudflare

Stay tuned for updates!

---

## 📁 Project Structure

```
terraform-basic/
├── .terraform/                    # Terraform internal files
│   └── environment
├── terraform.tfstate.d/          # Local state folders per workspace
│   ├── dev/
│   └── prod/
├── .gitignore                    # Ignore secrets and .terraform files
├── dev.tfvars                    # Dev environment variables
├── dev-secrets.tfvars            # 🔒 Dev secrets (NOT versioned)
├── dev-secrets.tfvars.example    # Example dev secrets template
├── prod.tfvars                   # Prod environment variables
├── prod-secrets.tfvars           # 🔒 Prod secrets (NOT versioned)
├── prod-secrets.tfvars.example   # Example prod secrets template
├── main.tf                       # Main Terraform configuration
├── variables.tf                  # Input variable definitions
├── makefile                      # Commands for common Terraform actions
└── README.md                     # You're here!
```

---

## 🚀 Quickstart

### 1. Clone the Repository

```bash
git clone https://github.com/sliusarchyn/terraform-basic.git
cd terraform-basic
```

### 2. Prepare Secret Files

Copy the example secrets files and fill in your own values:

```bash
cp dev-secrets.tfvars.example dev-secrets.tfvars
cp prod-secrets.tfvars.example prod-secrets.tfvars
```

> ⚠️ Do **not** commit `*-secrets.tfvars` files. They're excluded via `.gitignore`.

---

## 🛠 Makefile Commands

You can use the following shortcuts to avoid typing long Terraform commands:

### ➕ Create Workspaces

```bash
make create-dev
make create-prod
```

### ✅ Select and Init

```bash
make init-dev
make init-prod
```

### 📐 Plan Changes

```bash
make plan-dev
make plan-prod
```

### 🚀 Apply Infrastructure

```bash
make apply-dev
make apply-prod
```

### 💣 Destroy Infrastructure

```bash
make destroy-dev
make destroy-prod
```

---

## ✅ Requirements

- [Terraform](https://www.terraform.io/downloads)
- `make` utility (usually available by default on macOS/Linux)

---

## 🙌 Contribution

Feel free to fork this template or open an issue/PR if you'd like to improve or extend it!

