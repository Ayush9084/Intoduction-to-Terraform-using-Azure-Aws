**About HCL (HashiCorp Configuration Language)**



Terraform uses HCL (HashiCorp Configuration Language) — a human-readable configuration language.





**resource "aws\_instance" "example" {**

  **ami           = "ami-0c55b159cbfafe1f0"**

  **instance\_type = "t2.micro"**



  **tags = {**

    **Name = "MyEC2Instance"**

  **}**

**}**





🧩 **Structure:**



* resource → defines the infrastructure component (like EC2, VPC, etc.)
* "aws\_instance" → resource type
* "example" → resource name (you define it)
* Inside { } are arguments and attributes





**Terraform Basic Commands**



**| Command               | Description                                                             |**

**| --------------------- | ----------------------------------------------------------------------- |**

**| `terraform init`      | Initializes a Terraform working directory (downloads provider plugins). |**

**| `terraform validate`  | Validates the syntax and configuration files.                           |**

**| `terraform plan`      | Shows what changes Terraform will make before applying.                 |**

**| `terraform apply`     | Creates or modifies infrastructure as per your code.                    |**

**| `terraform destroy`   | Deletes all resources defined in the configuration.                     |**

**| `terraform fmt`       | Formats Terraform code properly.                                        |**

**| `terraform providers` | Lists providers used in the configuration.                              |**

**| `terraform show`      | Displays the current state of your infrastructure.                      |**

**| `terraform output`    | Shows the outputs after running apply.                                  |**





**Configure AWS with Terraform**



**Step 1️⃣: Install AWS CLI**



* sudo apt install awscli



**Step 2️⃣: Configure AWS**



* **aws configure**



**Enter:**



1. AWS Access Key ID
2. AWS Secret Access Key
3. Default region name (e.g., us-east-1)
4. Default output format (json)



**These credentials are saved in:**

**~/.aws/credentials**





**⚙️ Terraform Workflow Overview**



Terraform follows a lifecycle workflow:



**Write → Initialize → Validate → Plan → Apply → Destroy**



Each phase has a specific command — let’s explore them one by one with detailed explanations and examples.



🧩 1️⃣ **terraform init**



Initializes your Terraform working directory — this is always the first command you run after writing your Terraform configuration files (.tf).



🔹 **What it does:**



* Downloads the necessary provider plugins (like AWS, Azure, GCP).
* Prepares the working directory to run Terraform commands.
* Creates a hidden .terraform folder that stores plugins and backend data.



**🔹 Syntax:**



* terraform init



✅ 2️⃣ **terraform validate**



Checks your configuration files for syntax errors or invalid arguments.



🔹 **What it does:**



* Verifies that your .tf files are syntactically correct.
* Ensures all required arguments are present.
* Doesn’t check with the actual cloud provider (it’s local validation).



**🔹 Syntax:**



* terraform validate



🧠 3️⃣ **terraform plan**



Creates an execution plan — shows what Terraform will do without actually making changes.



🔹 **What it does:**



* Compares your current infrastructure (state file) with your configuration.
* Lists all actions Terraform will take:

&nbsp;  ➕ Create, 🔄 Update, or ❌ Delete resources.



**🔹 Syntax:**



* **terraform plan**





**🚀 4️⃣ terraform apply**

**🔹 Purpose:**



Applies the planned changes — this command creates, updates, or deletes infrastructure on the actual cloud.



**🔹 What it does:**



* Executes the actions shown in the plan.
* Interacts with the provider APIs (AWS, Azure, etc.).
* Updates the Terraform state file (terraform.tfstate) after execution.



**🔹 Syntax:**



* terraform apply



Then Terraform shows the plan again and asks for confirmation:



**✅ After completion:**



**Apply complete! Resources: 1 added, 0 changed, 0 destroyed.**



**💣 5️⃣ terraform destroy**

**🔹 Purpose:**



Deletes all infrastructure resources created by Terraform.



**🔹 What it does:**



* Reads your configuration and state file.
* Sends delete requests to the provider (e.g., AWS).
* Removes resources safely.



**🔹 Syntax:**



* terraform destroy



**✅ Output:**



**Destroy complete! Resources: 1 destroyed.**





**| Command              | Purpose                                               | When to Use                                    |**

**| -------------------- | ----------------------------------------------------- | ---------------------------------------------- |**

**| `terraform init`     | Initialize Terraform directory and download providers | First time setup or after adding new providers |**

**| `terraform validate` | Check syntax and structure                            | Before planning or applying                    |**

**| `terraform plan`     | Preview infrastructure changes                        | Before applying changes                        |**

**| `terraform apply`    | Apply configuration (create/update resources)         | To build or modify infrastructure              |**

**| `terraform destroy`  | Delete all created resources                          | To clean up environment                        |**





**💡 Tips**



* Store code in GitHub for version control.
* Use variables.tf for parameters and outputs.tf for results.
* Keep your AWS keys secure (don’t hardcode them).
