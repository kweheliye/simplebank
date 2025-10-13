# 🏦 Simple Bank Service

The **Simple Bank Service** is a backend web application built with **Golang** that provides secure and reliable APIs for core banking operations such as creating accounts, recording transactions, and transferring funds between accounts.  
It demonstrates how to build a clean, production-ready backend service using modern tools like **SQLC**, **PostgreSQL**, and **Docker**.

---

## 🚀 Tech Stack

- **Language:** Golang
- **Database:** PostgreSQL
- **ORM/Code Generator:** SQLC
- **Web Framework:** Gin (for RESTful APIs)
- **Containerization:** Docker & Docker Compose
- **Automation:** GitHub Actions
- **Migrations:** golang-migrate

---

## 🧩 Features

### 🧾 Account Management
- Create and manage bank accounts with owner’s name, balance, and currency.
- Retrieve and list all existing accounts.

### 💰 Transaction Recording
- Automatically record every balance change (credit or debit).
- Maintain a detailed ledger for each account to ensure transparency.

### 🔁 Money Transfers
- Securely perform fund transfers between two accounts.
- Ensures **transactional consistency** using PostgreSQL transactions — both accounts update together or not at all.

---

## 🏗️ Project Structure

```bash
.
├── api/                   # HTTP handlers and routes using Gin
├── db/
│   ├── migration/          # Database schema migrations
│   ├── queries/            # SQL queries used by SQLC
│   ├── sqlc/               # Auto-generated Go code by SQLC
│   └── util/               # Utility functions (DB connection, config)
├── docker-compose.yml      # Local multi-container setup
├── Dockerfile              # Application container build instructions
├── Makefile                # Developer commands (build, test, migrate)
├── main.go                 # Application entry point
└── README.md               # Project documentation
```

## Setup & Installation
git clone https://github.com/<your-username>/simple-bank.git
cd simple-bank
