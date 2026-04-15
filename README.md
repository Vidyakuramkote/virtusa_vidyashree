# Virtusa Multi-Component Project

## Overview
Prototype project with Java backend, Python ops tool, and SQL analytics.

## Components

### 1. corejava/ - FinSafe Banking App (Java)
- **Files:** `FinSafeApp.class`, `Account.class`, `InSufficientFundsException.class`
- **Description:** Console banking application handling accounts and insufficient funds exceptions.
- **Run:** 
  ```
  cd corejava
  java FinSafeApp
  ```

### 2. corepython/ - OpsBot Log Monitor (Python)
- **File:** `opsbot.py`
- **Description:** Parses `server.log` for security keywords (CRITICAL, ERROR, FAILED LOGIN), generates daily `security_alert_YYYY-MM-DD.txt` reports.
- **Run:** 
  ```
  python corepython/opsbot.py
  ```
- **Dependencies:** None (standard library).

### 3. coresql/ - SwiftShip Delivery Analytics (SQL)
- **File:** `swiftship.sql`
- **Description:** Schema for Partners/Shipments/DeliveryLogs with scorecard query for partner success rates (OTD, delays).
- **Sample Data:** DHL, FedEx, BlueDart shipments.
- **Run:** Import to PostgreSQL/MySQL, execute final SELECT for report:
  ```
  PartnerName | Total | Delayed | Success | SuccessRate
  DHL         | 2     | 1       | 1       | 50.00
  BlueDart    | 1     | 0       | 1       | 100.00
  FedEx       | 2     | 1       | 2       | 100.00
  ```

## Setup & Run
```
git clone https://github.com/Vidyakuramkote/virtusa_vidyashree.git
cd virtusa_vidyashree
# Run individual components as above
```

## Deployment
- **GitHub:** Pushed and live.
- **Cloud:** Railway/Render (add pom.xml, requirements.txt, PostgreSQL service).

## Build Notes
- Java: Compiled classes (Maven target/ artifacts ignored).
- Python/SQL: Ready-to-run.
