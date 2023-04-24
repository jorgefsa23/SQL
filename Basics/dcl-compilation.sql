#1. Granting privileges to a role:

GRANT SELECT, UPDATE ON orders TO sales_role;

/*This command grants the "sales_role" role the privileges to perform SELECT and UPDATE operations on the "orders" table. 
Users assigned to this role can then perform these operations without needing to be granted individual privileges.*/

#2. Revoking privileges from a role:

REVOKE INSERT ON customers FROM sales_role;

/*This command revokes the privilege to perform INSERT operations on the "customers" table from the "sales_role" role.*/

#3. Creating a new role:

CREATE ROLE marketing_role;

/*This command creates a new role named "marketing_role". 
Roles can be used to group together sets of privileges that are often granted together, making it easier to manage permissions for multiple users at once.*/

#4. Granting a user membership in a role:

GRANT marketing_role TO user4;

/*This command grants the user named "user4" membership in the "marketing_role" role, giving them access to the privileges associated with that role.*/

#5. Creating a new user:

CREATE USER user3 IDENTIFIED BY 'password123';

/*This command creates a new user named "user3" with the password "password123". 
The new user does not have any privileges yet and would need to be granted privileges before being able to perform any operations on the database.*/

#6. Granting privileges to a user:

GRANT SELECT, INSERT ON orders TO user1;

/*This command grants the user named "user1" the privileges to perform SELECT and INSERT operations on the "orders" table.*/

#6. Removing a user:

DROP USER user3;

/*This command removes the user named "user3" from the database, including any privileges that were previously granted to that user.*/

#7. Revoking a user's membership in a role:

REVOKE marketing_role FROM user4;

/*This command revokes the user named "user4" from the "marketing_role" role, removing their access to the privileges associated with that role.*/

#8. Revoking privileges from a user:

REVOKE UPDATE ON products FROM user2;

/*This command revokes the privilege to perform UPDATE operations on the "products" table from the user named "user2".*/
