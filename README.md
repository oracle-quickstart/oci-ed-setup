# oci-ed-setup

The Oracle Cloud Infrastructure Email Delivery service provides a fast and reliable managed solution for sending secured, high-volume marketing and transactional emails.

The Email Delivery service provides tools necessary to send application-generated email for mission-critical communications such as receipts, fraud detection alerts, multi-factor identity verification, and password resets.

The scripts provided here will enable to quickly setup the email delivery service without going through the manual steps to configure email domains, email senders, User SMTP credentials and DKIM (DomainKey Identified Mail)

## Prerequisites

- Permission to `manage` the following types of resources
  - Email domains
  - Approved Senders
  - DKIMs

- Quota to create the above resources.

If you don't have the required permissions and quota, contact your tenancy administrator. See [Policy Reference](https://docs.cloud.oracle.com/en-us/iaas/Content/Identity/Reference/policyreference.htm), [Service Limits](https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm), [Compartment Quotas](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcequotas.htm).

## Deploy Using Oracle Resource Manager

1. Click [![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/oracle-quickstart/oci-ed-setup/releases/latest/download/oci-ed-setup-latest.zip)

    If you aren't already signed in, when prompted, enter the tenancy and user credentials.

2. Review and accept the terms and conditions.

3. Select the region where you want to deploy the stack.

4. Follow the on-screen prompts and instructions to create the stack.

5. After creating the stack, click **Terraform Actions**, and select **Plan**.

6. Wait for the job to be completed, and review the plan.

    To make any changes, return to the Stack Details page, click **Edit Stack**, and make the required changes. Then, run the **Plan** action again.

7. If no further changes are necessary, return to the Stack Details page, click **Terraform Actions**, and select **Apply**.

8. Once the stack is successfully deployed select the job and check out the output variables for SMTP username, password and DKIM CNAME and TXT record.

## Deploy Using the Terraform CLI

### Clone the Module

Now, you'll want a local copy of this repo. You can make that with the commands:

    git clone https://github.com/oracle-quickstart/oci-ed-setup
    cd oci-ed-setup
    ls

### Set Up and Configure Terraform

1. Complete the prerequisites described [here](https://github.com/cloud-partners/oci-prerequisites).

2. Create a `terraform.tfvars` file, and specify the following variables:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
current_user_ocid    = "<user_ocid>"
fingerprint          = "<finger_print>"
private_key_path     = "<pem_private_key_path>"

# Region
region = "<oci_region>"

# Compartment
compartment_ocid = "<compartment_ocid>"
````

### Create the Resources

Run the following commands:

    terraform init
    terraform plan
    terraform apply

### Destroy the Deployment

When you no longer need the deployment, you can run this command to destroy the resources:

    terraform destroy

## Post Deployment

To test the setup use the SMTP credentials to send mails using your tool of choice.
