# Blue World Making

[![Stories in Ready](https://badge.waffle.io/Adron/blue-world-making.png?label=ready&title=Ready)](http://waffle.io/Adron/blue-world-making)

This repository is made up of configuration that builds out environments based on a phased approach. Each phase is dependent on the phase before the previous, but all can be run together in a seamless from from phase to phase.

*Phase 1:* This is the phase where initial infrastructure is brought up that will be used to provide hosting capabilities around Kubernetes. This phase could be skipped once the ability to use container services within AWS, GCP, and Azure are integrated, but for now the entirety of the environment is spooled up in order to actually host Kubernetes itself.

*Phase 2:* This is the phase where specific services, isolated in containers, are spun up in Kubernetes for the purpose of development needs. This includes things like CI/CD build services and related needs for software development purposes and ongoing infrastructure development.

*Phase 3:* This is the phase the is key to ongoing development. Sample projects, and respective isolated services and infrastructure are spun up pertinent to and as needed for particular development platforms. This could be .NET, Java, Go, Python, or any number of others.

Authentication Notes:

The AWS, GCP, and Azure CLIs all need setup before this can be used to execute against the respective environments. The following are collected notes about where to get the pertinent authentication credentials for each.

* **AWS** - The [AWS CLI installation instructions](https://aws.amazon.com/cli/) are available [here](https://aws.amazon.com/cli/).

* **GCP** - For GCP, the CLI is called `gcloud`. [Download](https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version) the CLI via the [Google Cloud SDK](https://cloud.google.com/sdk/) and then [install](https://cloud.google.com/sdk/downloads) it.

* **Azure** - The Azure CLI, be sure to get the v2.0 CLI, has installation instruction available [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest). This can be done via script, apt-get, and other ways.

* **Kubectl** - One the GCP `gcloud` tool is installed the easiest way to install `kubectl` is to use the [`gcloud components install kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/#download-as-part-of-the-google-cloud-sdk) command. There is also other ways to install `kubectl`, check the [installation documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl/) to determine what your preferred approach would be.

For setup of the credentials for Terraform the following environment variables, and related collateral were set.

```
export TF_VAR_subscription_id="<SUBSCRIPTION ID UUID GOES HERE>"
export TF_VAR_client_id="<CLIENT ID UUID GOES HERE>"
export TF_VAR_client_secret="<CLIENT SECRET UUID GOES HERE>"
export TF_VAR_tenant_id="<TENANT GUID UUID GOES HERE>"

export TF_VAR_aws_region="us-west-2"

export TF_VAR_azure_ssh_key="ssh-rsa AAAA YOUR SSH KEY HERE your-email-addy@gmail.com"
```

The easiest way to get the Azure client, tenant, and subscription information is as follows.

1. Execute `az account list` (insure you've logged in `az login`). This provides the subscription id labeled merely as *id* and tenant id as *tenantId*.
2. Then set the account `az account set --subscription="SUBSCRIPTION_ID"`.
3. Create a service principal to execute under `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"`. This outputs 5 values. 
```
{
    "appId": "00000000-0000-0000-0000-000000000000",
    "displayName": "azure-cli-2017-06-05-10-41-15",
    "name": "http://azure-cli-2017-06-05-10-41-15",
    "password": "0000-0000-0000-0000-000000000000",
    "tenant": "00000000-0000-0000-0000-000000000000"
}
```
with the appId equal to `client_id`, password equal to `client_secret`, and tenant is the `tenant_id`.  

These values can then be verified with `az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID`.

The singular item for GCP however is simply to get, download, and place the `accounts.json` file in a directory parallel to the `blue-world-making` directory in a directory called `secrets`.


