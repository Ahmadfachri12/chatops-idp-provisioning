## 🏗 Architecture Overview

![ChatOps Provisioning Workflow](workflow-diagram.png)

---

## 🔄 Workflow

1. A developer sends a provisioning command via **Slack**
2. **n8n** receives and validates the request
3. n8n triggers a **Jenkins pipeline** with parameters
4. Jenkins executes **Terraform** to:
   - Create a dedicated Kubernetes namespace
   - Deploy an application using Helm
5. A new environment is provisioned on demand

---

## 🛠 Tech Stack

- **Slack** – ChatOps interface
- **n8n** – Workflow orchestration & validation
- **Jenkins** – CI/CD execution engine
- **Terraform** – Infrastructure as Code
- **Kubernetes** – Environment isolation
- **Helm** – Application deployment

---

## ⚙️ Jenkins Pipeline Highlights

- Parameterized environment provisioning using `ENV_NAME`
- Dynamic Terraform configuration generation inside the pipeline
- Kubernetes namespace isolation for each environment
- Helm-based standardized application deployment
- Designed for asynchronous execution to support ChatOps workflows

---

## 🧠 Design Decisions

- **Dynamic Terraform generation**  
  Terraform configuration is generated at runtime to keep the pipeline self-contained and simplify orchestration.

- **Namespace-based isolation**  
  Each environment runs in its own Kubernetes namespace to support multi-tenant usage.

- **ChatOps-driven execution**  
  Slack is used as a self-service interface, reducing direct access to infrastructure systems.

---

## 🎯 Use Cases

- On-demand environment provisioning
- Internal Developer Platform (IDP) prototype
- ChatOps-driven CI/CD automation
- Learning project for SRE / DevOps / Platform Engineering

---

## 🚧 Future Improvements

- Add observability (metrics, logs, alerts)
- Implement role-based access control (RBAC)
- Add approval workflow via Slack
- Introduce environment templates (small / medium / large)
- Track provisioning SLOs and error budgets

---

## 📌 Notes

This project is intended as a **proof of concept (PoC)** to demonstrate platform engineering and SRE principles, not as a production-ready system.

---

## 📄 License

MIT License
