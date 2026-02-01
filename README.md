## 🏗 Architecture Overview

![ChatOps Provisioning Workflow](workflow-diagram.png)

---

# ChatOps-Based Kubernetes Environment Provisioning

This project implements a **ChatOps-driven Internal Developer Platform (IDP)** that allows developers to dynamically create and delete Kubernetes environments using **Slack commands**.

The entire workflow is fully automated and runs on a **local Kubernetes cluster**, enabling self-service infrastructure provisioning without direct access to Kubernetes, Jenkins, or Terraform.

---

## 🚀 Architecture Overview

The system follows this end-to-end automation flow:

**Developer → Slack → n8n → Jenkins → Terraform → Helm → Kubernetes**

A developer simply sends a command in Slack, and the platform handles orchestration, validation, provisioning, and deployment automatically.

---

## 🧠 How It Works

A developer triggers a Slack Slash Command such as: /deploy env_name
or to remove an environment: /destroy env_name


The request is processed by **n8n**, which validates the input and forwards it to **Jenkins**. Jenkins then executes a CI/CD pipeline that runs **Terraform** to create or destroy a Kubernetes namespace and uses **Helm** to deploy applications inside that namespace.

Each environment is isolated using Kubernetes namespaces.

---

## 🛠 Technology Stack

- **Slack** – ChatOps interface (Slash Commands)
- **n8n** – Automation, orchestration, and validation
- **Jenkins** – CI/CD pipeline execution
- **Terraform** – Infrastructure as Code
- **Helm** – Application deployment
- **Kubernetes** – Environment isolation using namespaces

---

## 📦 Project Structure

├── Jenkinsfile
├── terraform/
│ ├── main.tf
│ ├── provider.tf
│ ├── variables.tf
│ └── outputs.tf
└── README.md

---

## 🔄 End-to-End Workflow

1. Developer sends a command via Slack  
2. n8n receives and validates the command  
3. n8n triggers Jenkins with parameters  
4. Jenkins runs Terraform using `terraform-default` tool  
5. Terraform creates or destroys a Kubernetes namespace  
6. Helm deploys applications into the namespace  
7. Kubernetes provides an isolated environment ready to use  

---

## 🧪 Local Environment Requirements

- Kubernetes (Minikube or Kind)
- Jenkins (with Terraform tool configured)
- Terraform
- Helm
- n8n
- Slack App with Slash Commands

This project uses **local Terraform state** and does not require any cloud provider.

---

## 🧹 Environment Deletion

To remove an environment, simply run: /destroy env_name

Terraform will safely destroy the Kubernetes namespace and all resources inside it.

---

## 🎯 Use Cases

- Internal Developer Platform (IDP)
- ChatOps automation
- DevOps & Platform Engineering practice
- Kubernetes namespace lifecycle management
- Self-service infrastructure provisioning

---

## 🏁 Conclusion

This project demonstrates how **ChatOps, CI/CD, and Infrastructure as Code** can be combined to build a simple yet powerful Internal Developer Platform.

Developers can provision and manage Kubernetes environments **directly from Slack**, making the workflow fast, automated, and developer-friendly.



