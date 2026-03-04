# Linux Monitoring Automation 🚀

A lightweight **Linux system monitoring and automation project** built using **Bash scripting and Cron scheduling**.
The system periodically monitors CPU, Disk, and Memory usage and automatically sends email alerts when predefined thresholds are exceeded.

This project demonstrates how Linux system utilities and shell scripting can be combined to build a simple automated alerting system for server health monitoring.

---

# 📌 Project Overview

Modern systems require continuous monitoring to ensure reliability and performance.
This project provides a **simple automated monitoring framework** that collects system metrics and logs them for analysis.

* The project focuses on:
* Collects system resource metrics
* Compares them with defined thresholds
* Detects abnormal system usage
* Sends automated email alerts to administrators
* Runs automatically using scheduled jobs

---

# ⚙️ Features

✔ Automated monitoring of system resources
✔ CPU, Disk, and Memory usage detection
✔ Email alerts when system usage exceeds thresholds
✔ Modular Bash scripts for easy maintenance
✔ Automated execution using cron jobs
✔ Lightweight and efficient monitoring system
✔ Compatible with most Linux distributions

---

# 🏗️ Project Architecture

```
cron scheduler
      │
      ▼
main.sh (monitoring engine)
      │
      ├── cpu_monitor.sh
      ├── disk_monitor.sh
      └── memory_monitor.sh
      │
      ▼
threshold comparison
      │
      ▼
email_alert.sh
      │
      ▼
SMTP mail service
      │
      ▼
Administrator Email Alert
```

---

# 📂 Project Structure

```
linux-monitoring-automation/
│
├── scripts/
│   ├── main.sh
│   ├── cpu_monitor.sh
│   ├── disk_monitor.sh
│   └── memory_monitor.sh
│
├── config/
│   └── configuration files
│
├── logs/
│   ├── system.log
│   └── alerts.log
│
├── docs/
│   └── project documentation
│
└── README.md
```

---

# 🧠 How the System Works

1. A scheduled job triggers the monitoring script.
2. The main script runs monitoring modules to collect system resource metrics.
3. The collected values are compared with predefined thresholds.
4. If resource usage exceeds the allowed limit, the alert system is triggered.
5. An automated email notification is sent to the administrator.

---

# 📊 Example Log Output

```
DATE & TIME           | CPU           | DISK          | RAM
---------------------------------------------------------------
2026-03-04 10:00:01   | 32% (OK)      | 45% (OK)      | 55% (OK)
2026-03-04 12:00:01   | 91% (ERROR)   | 70% (OK)      | 60% (OK)
```

---

# 🛠️ Installation

Clone the repository:

```
git clone https://github.com/yourusername/linux-monitoring-automation.git
cd linux-monitoring-automation
```

---

# ⚡ Running the Monitoring Script

Run the monitoring script manually:

```
cd scripts
./main.sh
```

The script checks system resource usage and sends alerts if required.

---

# ⏱️ Automating with Cron

Monitoring can be scheduled using the Linux **cron scheduler**.

Example cron entry:

```
0 9,21 * * * /path/to/scripts/main.sh
```

This example runs the monitoring script **twice per day**.

---

# 📧 Alert System

When system resource usage crosses defined limits, the system automatically generates an alert and sends an email notification to the administrator.

Alerts help administrators respond quickly to issues such as

* High CPU utilization
* Disk space exhaustion
* Memory overconsumption

---

# 🔐 Security Considerations

* Configuration files are stored separately
* Sensitive credentials are protected using restricted permissions
* Scripts follow modular design for safer maintenance

---

# 🚀 Future Improvements

Possible enhancements include:

* Web dashboard for visualization
* Integration with messaging platforms for alerts
* Containerized deployment using Docker
* Log rotation and long-term storage
* Integration with enterprise monitoring tools

---

# 📚 Technologies Used

* Bash Scripting
* Linux System Utilities
* Cron Scheduler
* SMTP Mail Service
* Git & GitHub
