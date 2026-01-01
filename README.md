# ☁️ AWS Cloud Portfolio

[![Terraform](https://img.shields.io/badge/Terraform-IaC-purple?style=flat&logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-S3%20%2B%20CloudFront-orange?style=flat&logo=amazon-aws)](https://aws.amazon.com/)
[![Status](https://img.shields.io/badge/Status-Live-green?style=flat)]()

**Live Demo:** [https://d12345abcdef.cloudfront.net](https://d12345abcdef.cloudfront.net) *(Aggiorna questo link con il tuo dominio CloudFront)*

---

## 🇬🇧 English Version

### 🎯 Project Overview
This repository hosts the source code and infrastructure definitions for my personal cloud portfolio. The project demonstrates a **Serverless**, **Secure**, and **High-Performance** static website architecture on AWS.
Unlike a simple bucket hosting, this project implements enterprise-grade security practices using **Terraform** for Infrastructure as Code (IaC).

### 🏗️ Architecture Roadmap
The project follows a phased evolution to demonstrate increasing cloud complexity:

*   **Phase 1: Static Foundation (Completed ✅)**
    *   Responsive HTML5/CSS3/JS frontend with "Cyber-Security" theme.
    *   Local development environment.

*   **Phase 2: AWS Infrastructure (Completed ✅)**
    *   **IaC:** Full provisioning via Terraform (`aws_s3_bucket`, `aws_cloudfront_distribution`).
    *   **Storage:** Private S3 Bucket (Block Public Access enabled).
    *   **CDN:** Global content delivery via CloudFront Edge Locations.
    *   **Security:** OAC (Origin Access Control) to restrict S3 access *only* to CloudFront.
    *   **Encryption:** HTTPS enforcement and TLS certificates.

*   **Phase 3: Advanced Security (Next Step 🚧)**
    *   **WAF:** Implementation of AWS Web Application Firewall rules.
    *   **Backend:** API Gateway + Lambda integration.

### 🛠️ Tech Stack
*   **Infrastructure:** Terraform, AWS S3, AWS CloudFront.
*   **Frontend:** HTML5, CSS3, Vanilla JS.
*   **Tools:** AWS CLI, Git.

---

## 🇮🇹 Versione Italiana

### 🎯 Panoramica Progetto
Questo repository ospita il codice e l'infrastruttura del mio portfolio cloud. Il progetto dimostra un'architettura **Serverless**, **Sicura** e ad **Alte Prestazioni** su AWS.
A differenza di un semplice hosting statico, questo progetto implementa standard di sicurezza enterprise utilizzando **Terraform** per l'Infrastructure as Code (IaC).

### 🏗️ Roadmap Architetturale
Il progetto segue un'evoluzione a fasi per dimostrare competenze cloud crescenti:

*   **Fase 1: Fondamenta Statiche (Completata ✅)**
    *   Frontend HTML5/CSS3/JS responsivo con tema "Cyber-Security".
    *   Ambiente di sviluppo locale.

*   **Fase 2: Infrastruttura AWS (Completata ✅)**
    *   **IaC:** Provisioning completo via Terraform.
    *   **Storage:** Bucket S3 Privato (Block Public Access attivo).
    *   **CDN:** Distribuzione globale tramite CloudFront.
    *   **Sicurezza:** OAC (Origin Access Control) per limitare l'accesso S3 *solo* a CloudFront.
    *   **Crittografia:** HTTPS forzato e certificati TLS.

*   **Fase 3: Sicurezza Avanzata (Prossimo Step 🚧)**
    *   **WAF:** Implementazione di regole AWS Web Application Firewall.
    *   **Backend:** Integrazione API Gateway + Lambda.

### 🛠️ Stack Tecnologico
*   **Infrastruttura:** Terraform, AWS S3, AWS CloudFront.
*   **Frontend:** HTML5, CSS3, Vanilla JS.
*   **Strumenti:** AWS CLI, Git.

---

### 📬 Contact / Contatti
**Giuseppe La Selva** - Cloud & Security Enthusiast
📧 [g.laselva@outlook.it](mailto:g.laselva@outlook.it)
💼 [LinkedIn Profile](https://www.linkedin.com/in/giuseppe-laselva)
