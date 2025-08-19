from neo4j import GraphDatabase

URI = "neo4j+s://69010b09.databases.neo4j.io"
USER = "neo4j"
PASSWORD = "wiUgkefIW_05_S3HRju0S9adhDpa4HlfmDSG_dLgfoI"

QUERY = """
MATCH path=(a:Account)-[:TRANSFER*2..4]->(a)
WHERE ALL(r IN relationships(path) WHERE r.amount > 1000)
RETURN DISTINCT a.id AS start_account,
                [x IN nodes(path) | x.id] AS loop_accounts,
                [r IN relationships(path) | r.amount] AS amounts;
"""

class FraudDetector:
    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def detect(self):
        with self.driver.session() as session:
            results = session.run(QUERY)
            records = list(results)
            if not records:
                print("✅ No suspicious loops found.")
            else:
                print("🚨 Fraudulent transaction loops detected:")
                for r in records:
                    print(f"Start: {r['start_account']}, Path: {r['loop_accounts']}, Amounts: {r['amounts']}")

if __name__ == "__main__":
    detector = FraudDetector(URI, USER, PASSWORD)
    detector.detect()
    detector.close()
