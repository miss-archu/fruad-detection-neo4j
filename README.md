# 🔍 Fraud Detection with Neo4j

Detect **fraudulent money laundering loops** using **Neo4j Aura**.  
Graph model: **Person → OWNS → Account → TRANSFER → Account**.

---

## 📂 Files
- `setup.cypher` → sample dataset  
- `detect.cypher` → fraud loop query  
- `detect_fraud.py` → optional Python script  
- `diagram.png` → schema diagram  
- `requirements.txt` → Python dependencies  

---

## 🚀 Run on Neo4j Aura (Browser)

1. [Create free Aura DB](https://neo4j.com/cloud/aura/)  
2. Load sample data:
   ```cypher
   :source setup.cypher
Run fraud detection:

:source detect.cypher


Example result:

start_account | loop_accounts       | amounts
------------------------------------------------
A1            | [A1,A2,A3,A1]       | [5000,5000,5000]

🐍 Run with Python (Optional)
pip install -r requirements.txt


Update URI, USER, PASSWORD in detect_fraud.py, then run:

python detect_fraud.py
