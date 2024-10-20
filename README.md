# Kubernetes Cluster Setup and Deployment

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Cluster Setup](#cluster-setup)
- [Deployment](#deployment)
- [Verification](#verification)
- [Monitoring Setup](#monitoring-setup)
- [Conclusion](#conclusion)

## Introduction
This document outlines the steps taken to set up a Kubernetes cluster using k3s and deploy a simple workload. The workload consists of a deployment that runs HashiCorp Terraform.

## Prerequisites
- A machine running Ubuntu with WSL installed.
- Basic understanding of Kubernetes and Terraform.
- Installed tools: `kubectl`, `k3s`, and `Terraform`.

## Cluster Setup
1. **Install k3s**:
   Run the following command to install k3s:
   ```bash
   curl -sL https://get.k3s.io | sh -

2. **Verify k3s Installation:** Check the status of the nodes:
   ```bash
   kubectl get nodes

3. **Configure kubectl:** If you encounter permission errors, modify the kubeconfig permissions:
   ```bash
   sudo k3s kubectl config view --raw > /etc/rancher/k3s/k3s.yaml
   sudo chmod 644 /etc/rancher/k3s/k3s.yaml


## Deployment

1. **Create a Deployment YAML File:** Create a file named terraform-k8s-deployment.yml with the following content:
   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
   name: terraform-deployment
   spec:
   replicas: 1
   selector:
      matchLabels:
         app: terraform
   template:
      metadata:
         labels:
         app: terraform
      spec:
         containers:
         - name: terraform
            image: hashicorp/terraform:1.3.9
            command: ["sleep", "infinity"]

2. **Apply the Deployment:** Run the following command to deploy the application:
   ```bash
   kubectl apply -f terraform-k8s-deployment.yml
   

### Verification

1. **Check Deployments:** Verify that the deployment is running:
   ```bash
   kubectl get deployments

2. **Check Pods:** Ensure that the pods are running:
   ```bash
   kubectl get pods