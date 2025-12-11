# Day 1 – AWS IAM Basics (Beginner Level)

This file contains **simple explanations + real banking‑industry examples** to remember concepts clearly.

---

##  What Is IAM?

IAM (Identity and Access Management) helps control **who** can access **what** inside AWS.

* **Users** → People who log in (employees)
* **Groups** → Team with same permissions
* **Roles** → Temporary permissions for apps or external users
* **Policies** → JSON rules that allow/deny actions

IAM is a **global service** (not region‑specific).

---

##  IAM in Banking – Simple Real‑World Examples

### **1. Customer Support User (Read‑Only Access)**

A support executive must **only view** customer documents stored in S3.

* IAM user: `customer-support-user`
* Policy: `AmazonS3ReadOnlyAccess`
* MFA enabled

📌 *They can read files but cannot edit or delete anything.*

---

### **2. Loan Officers Group (Department Access)**

A team reviews home loan applications stored in DynamoDB.

* Group: `loan-officers`
* Policy: `AmazonDynamoDBReadWriteAccess`
* Add multiple users to the group

📌 *Same access for everyone in that department.*

---

### **3. Mobile Banking App Role (Application Access)**

A bank’s mobile app needs to read customer balances.

* IAM Role: `mobile-app-role`
* Trusted entity: AWS Lambda
* Policy: Read access to DynamoDB

📌 *A role acts like a temporary access card for applications.*

---

### **4. External Auditor Role (Temporary Access)**

Auditors require **view-only** permissions for 1 week.

* Role: `audit-readonly-role`
* Policy: Read-only S3 + CloudWatch Logs
* Access expires after 7 days

📌 *They can check records but not modify anything.*

---

### **5 ATM Logs Analyst (Least Privilege)**

ATM logs are stored in CloudWatch. A backend engineer should only view logs.

* Allow: `cloudwatch:FilterLogEvents`
* Deny: all other CloudWatch actions

📌 *Gives only exact required permissions — nothing extra.*

---

##  Custom Policy Example (Banking)

Risk analyst must query only "High-Value Transactions" stored in a DynamoDB table.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "dynamodb:Query",
      "Resource": "arn:aws:dynamodb:ap-south-1:123456789012:table/Transactions"
    }
  ]
}
```

📌 *Allows only Query — not write, update, delete.*

---

