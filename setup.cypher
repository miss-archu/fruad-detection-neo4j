// Setup dataset: Persons, Accounts, and Transactions

// Clear existing data
MATCH (n) DETACH DELETE n;

// Create Persons
CREATE (p1:Person {id: 'P1', name: 'Alice'})
CREATE (p2:Person {id: 'P2', name: 'Bob'})
CREATE (p3:Person {id: 'P3', name: 'Charlie'});

// Create Accounts
CREATE (a1:Account {id: 'A1'})
CREATE (a2:Account {id: 'A2'})
CREATE (a3:Account {id: 'A3'});

// Ownership
CREATE (p1)-[:OWNS]->(a1);
CREATE (p2)-[:OWNS]->(a2);
CREATE (p3)-[:OWNS]->(a3);

// Transfers forming a suspicious loop
CREATE (a1)-[:TRANSFER {amount: 5000, date:'2024-01-10'}]->(a2);
CREATE (a2)-[:TRANSFER {amount: 5000, date:'2024-01-11'}]->(a3);
CREATE (a3)-[:TRANSFER {amount: 5000, date:'2024-01-12'}]->(a1);

// Normal transaction
CREATE (a1)-[:TRANSFER {amount: 200, date:'2024-01-15'}]->(a3);
