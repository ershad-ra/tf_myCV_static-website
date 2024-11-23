# **Static Website Hosting with Terraform**

This project automates the deployment of a static website on AWS using Terraform. It leverages two modules to manage **S3** for storage and **CloudFront** for global content delivery.

---

## **Project Overview**

### **Infrastructure Components**
1. **S3 Bucket**:
   - Stores the static website files (`HTML`, `CSS`, and image files).
   - Ensures public access is restricted for security.
   - Automatically uploads the website files to the bucket during deployment.

2. **CloudFront Distribution**:
   - Provides a secure, global Content Delivery Network (CDN) for the website.
   - Uses Origin Access Control (OAC) to securely access the private S3 bucket.
   - Redirects all traffic to HTTPS and sets `index.html` as the default root object.

---

## **Folder Structure**

```plaintext
static-website-terraform/
├── modules/
│   ├── bucket/                  # S3 bucket module
│   │   ├── main.tf              # Logic for creating the bucket and uploading files
│   │   ├── outputs.tf           # Outputs for bucket attributes
│   │   └── variables.tf         # Input variables for the bucket module
│   ├── cloudfront/              # CloudFront module
│   │   ├── main.tf              # Logic for creating the CloudFront distribution
│   │   ├── outputs.tf           # Outputs for CloudFront attributes
│   │   └── variables.tf         # Input variables for the CloudFront module
├── static_website/              # Static website files
│   ├── index.html               # Homepage HTML
│   ├── index.css                # Stylesheet for the website
│   └── avatar.jfif              # Sample image file
├── main.tf                      # Root configuration to orchestrate modules
├── outputs.tf                   # Outputs for the entire project
├── variables.tf                 # Global input variables
├── provider.tf                  # Provider configuration (AWS)
└── README.md                    # Project documentation


