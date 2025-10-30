In Terraform, \*\*dependencies\*\* mean that some resources must be created \*\*before\*\* others, because they \*\*depend\*\* on each other.



\### ✅ Simple Example (Azure)



You cannot create a \*\*Subnet\*\* before creating a \*\*Virtual Network\*\*, right?



So the \*\*Subnet depends on the Virtual Network\*\*.



\### Terraform handles dependencies automatically 👇



```hcl

**resource "azurerm\_resource\_group" "rg" {**

  **name     = "myrg"**

  **location = "East US"**

**}**



**resource "azurerm\_virtual\_network" "vnet" {**

  **name                = "myvnet"**

  **location            = azurerm\_resource\_group.rg.location**

  **resource\_group\_name = azurerm\_resource\_group.rg.name**

  **address\_space       = \["10.0.0.0/16"]**

**}**



**resource "azurerm\_subnet" "subnet" {**

  **name                 = "subnet1"**

  **resource\_group\_name  = azurerm\_resource\_group.rg.name**

  **virtual\_network\_name = azurerm\_virtual\_network.vnet.name  # <-- Here dependency**

  **address\_prefixes     = \["10.0.1.0/24"]**

**}**

```



\### 🧠 How Terraform knows the order?



Because we reference other resources like:



\* `azurerm\_resource\_group.rg.name`

\* `azurerm\_virtual\_network.vnet.name`



Terraform reads those references and understands:



1️⃣ Create Resource Group

2️⃣ Create Virtual Network

3️⃣ Create Subnet



\### ✨ In simple words



> \*\*Dependency means one resource must be created before another.\*\*



Terraform checks resource references and builds infrastructure in correct order \*\*automatically\*\*.



\### ⚠️ If needed, we can force dependency too



```hcl

**depends\_on = \[azurerm\_virtual\_network.vnet]**

```



But usually Terraform figures it out on its own 👍



---



\### 🪄 Real-life example to remember



Like building a house:



\* First build \*\*foundation\*\* (Resource Group)

\* Then \*\*walls\*\* (VNET)

\* Then \*\*rooms\*\* (Subnet)



Terraform makes sure things are built in \*\*correct order\*\*.



---



