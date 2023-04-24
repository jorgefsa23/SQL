
#1. Starting a transaction:

BEGIN TRANSACTION;

/*This command starts a transaction, which allows multiple SQL statements to be 
grouped together and treated as a single, atomic operation. This ensures that either 
all the statements are executed, or none of them are.*/

#2. Committing a transaction:

COMMIT;

/*This command commits the current transaction, making all the changes made within 
the transaction permanent and visible to other users.*/

#3. Rolling back a transaction:

ROLLBACK;

/*This command rolls back the current transaction, undoing any changes made within 
the transaction and restoring the database to its state prior to the transaction.*/

#4. Setting a savepoint within a transaction:

SAVEPOINT my_savepoint;

/*This command sets a savepoint within the current transaction, which allows the transaction 
to be rolled back to that point rather than being rolled back entirely.*/

#5. Rolling back to a savepoint within a transaction:

ROLLBACK TO my_savepoint;

/*This command rolls back the current transaction to the savepoint named "my_savepoint", 
undoing any changes made since that point and leaving any changes made prior to the savepoint intact.*/
