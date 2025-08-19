// Fraud detection: find loops of suspicious transfers
MATCH path=(a:Account)-[:TRANSFER*2..4]->(a)
WHERE ALL(r IN relationships(path) WHERE r.amount > 1000)
RETURN DISTINCT a.id AS start_account,
                [x IN nodes(path) | x.id] AS loop_accounts,
                [r IN relationships(path) | r.amount] AS amounts;
