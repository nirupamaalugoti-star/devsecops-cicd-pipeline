# DevSecOps CI/CD Pipeline (Security-Gated)

**What this demonstrates:** DevSecOps — the emerging skill called out as carrying a 10-20% salary
premium. Security-first pipelines that scan before deploy, not after.

## Pipeline stages
1. Lint + unit test the app
2. `Checkov` scans Terraform for misconfigurations (public S3, open SGs, missing encryption)
3. `Trivy` scans the built container image for CVEs
4. `OPA/Conftest` enforces policy (e.g., no `:latest` tags, resource limits required, no privileged containers)
5. Build fails the PR if any gate fails — build only proceeds to deploy on green

## How to run locally
```bash
checkov -d ../01-eks-platform-terraform/terraform
trivy image your-repo/sample-app:latest
conftest test k8s-manifest.yaml -p policies/opa
```

## Resume bullet template
"Built a security-gated CI/CD pipeline (GitHub Actions) integrating Checkov for IaC scanning, Trivy for
container CVE scanning, and OPA policy enforcement — blocking non-compliant deploys before they reach
production."
