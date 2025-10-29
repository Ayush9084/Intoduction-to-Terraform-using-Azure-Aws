🌍 **Introduction to Terraform**

Welcome to the Introduction to Terraform repository!
This project is designed to help you learn and practice Infrastructure as Code (IaC) using Terraform, a powerful tool for automating cloud infrastructure deployment.

🚀** What is Terraform?**

Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp.
It allows you to define, provision, and manage your cloud infrastructure using code — making deployments automated, consistent, and repeatable.

🧠 Learning Objectives

By exploring this repository, you will learn:

What Terraform is and why it’s used

How to install and configure Terraform

Key commands (init, plan, apply, destroy)

Understanding Providers, Resources, Variables, and State files

How to create and manage AWS infrastructure with Terraform

How to handle errors and troubleshoot issues

⚙️ Prerequisites

Before you begin, make sure you have:

Basic knowledge of Cloud Platforms (AWS/Azure/GCP)

Installed:

Terraform

AWS CLI

VS Code
 or any text editor

An AWS account (for hands-on labs)

🏗️ **Terraform Workflow**

Terraform uses a simple Write → Plan → Apply → Destroy workflow:

Step	Command	Description

Initialize	terraform init	Downloads provider plugins
Validate	terraform validate	Checks configuration syntax
Plan	terraform plan	Shows execution plan
Apply	terraform apply	Provisions infrastructure
Destroy	terraform destroy	Deletes created resources

📁 Repository Structure
introduction-to-terraform/
│
├── main.tf                 # Main Terraform configuration file
├── variables.tf            # Variables definitions
├── outputs.tf              # Output values
├── provider.tf             # Provider configuration (e.g., AWS)
├── README.md               # Documentation
└── examples/               # Example configurations

☁️ **Example: Create AWS EC2 Instance**

Below is a simple Terraform example that provisions an EC2 instance on AWS.

**provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Example"
  }
}**

Run Commands:
terraform init
terraform validate
terraform plan
terraform apply


After applying, check your AWS Console → EC2 Instances to verify your instance creation.

🔐 Terraform State File

Terraform creates a terraform.tfstate file that stores the state of your infrastructure.
Never edit this file manually. It’s essential for tracking resources Terraform manages.

You can also use remote backends (like AWS S3 or Azure Blob) to store your state file securely when working in teams.

🧩 Key Terraform Concepts

Concept	Description
**Providers	Plugins for cloud platforms (AWS, Azure, GCP, etc.)
Resources	Infrastructure components (VMs, networks, etc.)
Variables	Used to make configuration flexible
Outputs	Display useful information after deployment
Modules	Reusable collections of Terraform code**

🧰 Common Terraform Commands
Command	Description

**terraform init	Initialize a working directory
terraform validate	Validate configuration
terraform plan	Preview the changes Terraform will make
terraform apply	Apply configuration and create resources
terraform destroy	Remove all resources
terraform fmt	Format your code properly
terraform show	Show details of current state
terraform output	Display output variables**

⚠️ Troubleshooting
Error	Possible Solution
Error: Invalid provider configuration	Check provider block and credentials
Error: Unauthorized	Ensure correct AWS credentials using aws configure
Error: Resource already exists	Run terraform refresh or remove duplicate resources
📘 References

Terraform Official Docs

AWS Provider Documentation

HashiCorp Learn Tutorials

Terraform GitHub Repository

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# 🌍 Introduction to Terraform using Azure and AWS

This repository provides a beginner-friendly introduction to **Terraform**, focusing on how to use it for automating infrastructure deployment on **Microsoft Azure** and **Amazon Web Services (AWS)**.  
It covers fundamental Terraform concepts, installation, configuration, and real-world examples for provisioning cloud resources.

---

## 🚀 What is Terraform?

**Terraform** is an open-source **Infrastructure as Code (IaC)** tool developed by **HashiCorp**.  
It allows developers and DevOps engineers to define, provision, and manage infrastructure using simple, declarative configuration files.

### 🔑 Key Features:
- **Cloud Agnostic** – Works with Azure, AWS, GCP, and more.
- **Declarative Syntax** – Define *what* you want, not *how* to build it.
- **Version Controlled Infrastructure** – Store your infrastructure setup in Git.
- **Reusable Modules** – Simplify repetitive configurations.

---

## 🧩 Prerequisites

Before getting started, ensure you have:
- **Terraform** installed ([Download Terraform](https://developer.hashicorp.com/terraform/downloads))
- **Azure CLI** or **AWS CLI** installed and configured
- Basic understanding of:
  - Cloud computing
  - Command-line interface
  - YAML / JSON syntax (optional)

---

## ☁️ Terraform with Azure

### Steps:
1. **Install Terraform**
   ```bash
   sudo apt update
   sudo apt install terraform -y


💡 Author

Ayush Pandey
🌐 Cloud & DevOps Enthusiast |☁️ Azure | | ☁️ AWS | ⚙️ Terraform | 🧩 Automation

“Infrastructure as Code turns manual cloud setup into reusable, version-controlled automation.”
