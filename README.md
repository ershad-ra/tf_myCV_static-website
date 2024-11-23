# Static Website Infrastructure with Terraform

## Overview

This Terraform setup creates a static website hosted on AWS with the following components:
- S3 Bucket for storing website files.
- CloudFront distribution for delivering content globally.
- Origin Access Control (OAC) for secure access to the S3 bucket.

## Prerequisites

1. AWS CLI installed and configured.
2. Terraform installed locally.
3. Files for the website (`index.html`, `index.css`, `avatar.jfif`) placed in the `website_files/` folder.

## File Structure

