# Azure-VMSS-CI-CD-pipeline
This project demonstrates how Infrastructure as Code (IaC) and CI/CD can be used to automate the deployment of scalable Azure infrastructure. The solution addresses common operational challenges such as manual provisioning, deployment inconsistencies, and scaling limitations by using Terraform and Azure DevOps to deploy a Virtual Machine Scale Set, Load Balancer, NAT Gateway, and supporting network infrastructure. Autoscaling policies allow the environment to automatically adjust compute capacity based on demand while the CI/CD pipeline provides repeatable and reliable deployments.
<br>
<br>
<br>
<br>
## Business Problem
Many organizations struggle with:

- Manual infrastructure deployments
- Inconsistent environments
- Slow provisioning times
- Infrastructure drift
- Over-provisioning resources
- Inability to quickly scale during traffic spikes
<br>
<br>

## How This Project Solves It
**Business Challenge**

A growing application requires reliable infrastructure that can scale with demand. Manual deployments are slow, error-prone, and difficult to reproduce across environments.

**Solution**

Built an automated Azure infrastructure deployment platform using Terraform and Azure DevOps that provisions networking, compute, load balancing, and autoscaling resources through a CI/CD pipeline.

**Business Outcome**

- Reduced manual deployment effort through Infrastructure as Code
- Enabled repeatable and consistent deployments
- Improved scalability using VM Scale Sets and autoscaling policies
- Increased availability through load-balanced infrastructure
- Reduced operational overhead by automating infrastructure provisioning
<br>
<br>
<br>
<br>

## Terraform Configuration Repository
<img width="1622" height="784" alt="repo" src="https://github.com/user-attachments/assets/8fae8e40-18cb-4af7-8d0e-679924c52237" />
<br>
The Terraform infrastructure code is stored in Azure Repos and organized into separate configuration files for networking, compute, autoscaling, and CI/CD automation. This structure helps keep deployments consistent, repeatable, and version controlled.
<br>
<br>
<br>
<br>

## Terraform Plan Validation
<img width="1916" height="885" alt="tf plan" src="https://github.com/user-attachments/assets/ccbf2785-fd18-43a0-833b-29d0952dc5a2" />
<br>
Before any resources are deployed, the Azure DevOps pipeline runs a Terraform plan to preview the proposed infrastructure changes. This step helps verify the deployment, catch configuration issues early, and provides visibility into exactly what resources will be created in Azure.
<br>
<br>
<br>
<br>

## Release Pipeline Deployment
<img width="887" height="736" alt="release pipeline" src="https://github.com/user-attachments/assets/5fb4e574-8463-4502-801d-b3b99e3a0fe5" />
<br>
This release pipeline takes the Terraform artifacts generated during the build stage and deploys them to Azure. Automating the deployment process helps reduce manual changes and ensures infrastructure is deployed consistently every time.
<br>
<br>
<br>
<br>

## Terraform Apply Execution
<img width="960" height="851" alt="tf apply " src="https://github.com/user-attachments/assets/ef8100f8-1e62-4f5d-8111-6263417eca8b" />
<br>
After the deployment is approved, Terraform applies the planned changes and provisions the Azure infrastructure. The logs show the successful creation of resources including the virtual network, network security group, load balancer, NAT gateway, Backend pools, VM Scale Set, and autoscaling configuration.
<br>
<br>
<br>
<br>

## Deployed Azure Environment
<img width="1896" height="882" alt="resources in portal" src="https://github.com/user-attachments/assets/974f8e35-112a-4c97-9366-b21686ca0164" />
<br>
<img width="1915" height="751" alt="backend pools" src="https://github.com/user-attachments/assets/10fee2f8-0d7d-489b-a6c6-f260722222e9" />
<br>

This screenshot shows the Azure resources that were successfully provisioned through the Terraform deployment pipeline. The environment includes a Virtual Machine Scale Set, Load Balancer, NAT Gateway, Virtual Network, Network Security Group, Public IP addresses, and supporting resources required for a scalable and highly available deployment. This demonstrates how Infrastructure as Code can be used to consistently deploy and manage a complete Azure environment without manually creating resources in the Azure portal.
<br>
<br>
<br>
<br>
<br>

## Challenges & Lessons Learned
- Configuration files weren't being found during release pipeline due to incorrect directory and artifact path configurations.
- VM Scale Set deployments initially failed due to Azure capacity constraints within specific availability zones.
- Tested multiple VM sizes and deployment configurations to improve deployment reliability.
