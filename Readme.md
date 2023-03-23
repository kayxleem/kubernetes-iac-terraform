# EKS Cluster Socks Shop Sample

This example shows how to provision an EKS cluster with:

## Prerequisites

Ensure that you have the following tools installed locally:

1. [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. [kubectl](https://Kubernetes.io/docs/tasks/tools/)
3. [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

3. [helm](Helmhttps://helm.sh)


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



1. configure your acme-issuer for ssl

    ```sh
    kubectl apply -f deployments/ssl/acme-issuer.yaml
    
    ```

## Deploy socks shop

1. Run the deployment

    ```sh
    kubectl apply -f deployments/sockshop/socksshopdeploy.yaml
    
    ```


2. (Optional) Configure monitoring for your socks shop with the instrucion in the [manifests-monitoring](deployment/sockshop/manifests-monitoring/).

3. (Optional) Configure Ingress for your deployment

    ```sh
    kubectl apply -f deployments/sockshop/sockshopingress.yaml
    
    ```
[![Screenshot of socks homepage](/screenshots/socksshop.png)](/screenshots/socksshop.png)

## Deploy MongoDB APP

1. Run the deployment

    ```sh
    kubectl apply -f deployments/mongoexpress/mongo-secret.yaml
    kubectl apply -f deployments/mongoexpress/mongo.yaml
    kubectl apply -f deployments/mongoexpress/mongo-configmap.yaml
    kubectl apply -f deployments/mongoexpress/mongo-express.yaml
    
    ```

2. (Optional) Configure Ingress for your deployment

    ```sh
    kubectl apply -f deployments/ingress/sockshopingress.yaml
    
    ```

# monitoring and logging

1. Deploy prometheus stack to access grafana

    ```sh
helm install prometheus prometheus-community/kube-prometheus-stack
    
    ```
2. (Optional) Configure Ingress for your deployment

    ```sh
    kubectl apply -f deployments/ingress/grafanaingress.yaml
    
    ```


[![Screenshot of Grafana](/screenshots/graffanadashboard.png)](/screenshots/graffanadashboard.png)

# CI CD

This configuration also sets up a Jenkins server that you can use to set up your CICD Pipeline. 


## Set up Jenkins

Access and set up your jenking server from the IP created at port 8000


## Set up your Credentials on Jenkins.

Add the neccesary credentials 

## Set up Jenkins to run the jenkins file on this repo. 

You can customise the provide sample jenkin file according to your deployment requirements and create your deployment pipeline on jenkins 

[![Screenshot of Deployment](/screenshots/samplepipelinesuccess.jpg)](/screenshots/samplepipelinesuccess.jpg)

## Destroy

To teardown and remove the resources created in this example:



Delete the apps using `kubectl` 
Then you can start delete the terraform resources:
```sh

terraform destroy 
````