SELECT * FROM market.receivables;

use market;

# to identify receivables with situation = 1
SELECT Client_ID, DateExpiration, Total FROM receivables 
WHERE Situation=1;

# to identify the name from table clients with receivable in situation 1:
SELECT receivables.Id as receivable, clients.Client_Name, clients.passport, receivables.DateExpiration, receivables.Total as Registered
	FROM receivables
    INNER JOIN clients
    ON clients.Id = receivables.Client_ID
    where Situation = "1";
    
    


