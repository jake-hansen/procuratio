# Procuratio

Procuratio is an example user management web application for CSCI 3830. 

### Getting Started
The app can be deployed easily to any server that can handle `war` files. 

The maven goal `clean build` can be run to produce a deployable artifact.

### Database
Procuratio utilizes a MySQL database to store information needed to run the application. The Flyway migration utility can be used to simplify creation of the database schemas.

Ensure that you have a working MySQL server that you can access. Prepare a new schema called `procuratio`. This will be the schema that the application uses.

Run the maven goal `flyway:migrate`. You should see a success message and see that the database was updated with the latest migrations.
