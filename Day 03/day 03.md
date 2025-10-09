**🌱 Terraform Modules**





What is a Module in Terraform?



A module in Terraform is a reusable, organized group of Terraform configurations (like .tf files) that manage a specific part of your infrastructure.



In simple words —



A module is like a folder that contains Terraform code you can reuse, share, and maintain easily.



Terraform automatically treats every directory with .tf files as a module — the root module is your main working directory, and you can call child modules from it.



Example:



Let’s say you are creating multiple EC2 instances with the same configuration.



Instead of writing this code again and again, you can create a module like this 👇





------------------------------------------------------------------------------------------------------------------------------------------





**📁 Folder structure:**





**terraform-project/**

**│**

**├── main.tf**

**└── modules/**

    **└── ec2/**

        **├── main.tf**

        **├── variables.tf**

        **└── outputs.tf**



----------------------------------------------------------------------------------------------------------------------------------------

**modules/ec2/main.tf**



**resource "aws\_instance" "example" {**

  **ami           = var.ami**

  **instance\_type = var.instance\_type**

  **tags = {**

    **Name = var.name**

  **}**

**}**



-----------------------------------------------------------------------------------------------------------------------------------------

**modules/ec2/variables.tf**



**variable "ami" {}**

**variable "instance\_type" {}**

**variable "name" {}**





----------------------------------------------------------------------------------------------------------------------------------------



**main.tf (root)**





**provider "aws" {**

  **region = "us-east-1"**

**}**



**module "web\_server" {**

  **source        = "./modules/ec2"**

  **ami           = "ami-0c55b159cbfafe1f0"**

  **instance\_type = "t3.micro"**

  **name          = "WebServer"**

**}**



**module "db\_server" {**

  **source        = "./modules/ec2"**

  **ami           = "ami-0c55b159cbfafe1f0"**

  **instance\_type = "t3.micro"**

  **name          = "DBServer"**

**}**







-----------------------------------------------------------------------------------------------------------------------------------------





**✅ Now, both EC2 instances are created using the same module, avoiding code duplication.**





**🚀 Advantages of Using Modules**





**| Advantage                 | Description                                                                                        |**

**| ------------------------- | -------------------------------------------------------------------------------------------------- |**

**| \*\*1. Reusability\*\*        | You can reuse the same module across multiple projects or environments (e.g., dev, test, prod).    |**

**| \*\*2. Simplified Code\*\*    | Keeps Terraform configuration clean, organized, and easy to read.                                  |**

**| \*\*3. Scalability\*\*        | Makes it easier to manage large infrastructure — you just call the module instead of copying code. |**

**| \*\*4. Consistency\*\*        | Ensures that every environment follows the same setup, reducing configuration drift.               |**

**| \*\*5. Easier Maintenance\*\* | Update the module once, and all resources using it get consistent updates.                         |**

**| \*\*6. Collaboration\*\*      | Teams can share and version modules in GitHub or Terraform Registry.                               |**

**| \*\*7. Modularity\*\*         | Breaks infrastructure into logical, manageable parts (networking, compute, storage, etc.).         |**





------------------------------------------------------------------------------------------------------------------------------------------







**🧩 Types of Modules**



1. Root Module → Your main Terraform directory where you run commands (terraform init, plan, apply).
2. Child Module → A module called by another module.
3. Published Module → A module shared via GitHub or Terraform Registry.







**🏁 In short**



**Terraform modules help you build infrastructure like LEGO blocks — small, reusable, and easy to combine.**

