# Procuratio

Procuratio is an example user management web application for CSCI 3830. 

### Getting Started
The app can be deployed easily to any server that can handle `war` files. 

The maven goal `clean install` can be run to produce a deployable artifact.

#### Environment Variables

There are a few environment variables that need to be set in order for the application to function properly.

* `PROCURATIO_DATABASE_URL` - Database URL to connect to. For example, `jdbc:mysql://localhost/procuratio`  is a valid value for this variable.
* `PROCURATIO_DATABASE_USERNAME` - Database username
* `PROCURATIO_DATABASE_PASSWORD` - Database password

### Database
Procuratio utilizes a MySQL database to store information needed to run the application. The Flyway migration utility can be used to simplify creation of the database schemas.

Ensure that you have a working MySQL server that you can access. Prepare a new schema called `procuratio`. This will be the schema that the application uses.

Run the maven goal `flyway:migrate`. You should see a success message and see that the database was updated with the latest migrations.

Note the file `database/mysql.conf` needs to be edited as shown in the provided configuration example file located at `database/mysql.conf.example`. Otherwise, flyway will not be able to connect to the database and perform migrations.

If you wish to not use flyway, you will need to manually run the migration scripts found in the `database/migrations` directory.
