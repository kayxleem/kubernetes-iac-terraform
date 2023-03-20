# EKS Cluster Socks Shop Sample

This example shows how to provision an EKS cluster with:

## Prerequisites

Ensure that you have the following tools installed locally:

1. [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. [kubectl](https://Kubernetes.io/docs/tasks/tools/)
3. [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)


## Deploy

To provision this example:

```sh
terraform init
terraform apply
```

Enter `yes` at command prompt to apply

## Validate

The following command will update the `kubeconfig` on your local machine and allow you to interact with your EKS Cluster using `kubectl` to validate the deployment.

1. Run `update-kubeconfig` command:

    ```sh
    aws eks --region <REGION> update-kubeconfig --name <CLUSTER_NAME>


# deployment


## Set up ssl with let's encrypt

1. install cert manager on the clusters with the following commands:

    ```sh
    kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
    ```



## Destroy

To teardown and remove the resources created in this example:



Delete the apps using `kubectl` 
Then you can start delete the terraform resources:
```sh

terraform destroy 
````