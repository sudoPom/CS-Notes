# The Database Management  System
The `Database management system` is a software system that allows users to define, create and maintain a database, and provides controlled access to the database.

Services provided by a DBMS includes:
* Security system - preventing unauthorised access.
* Integrity system - keeps data consistent by managing the concurrent access to the database by multiple users. Reduces data redundency.
*  Data language - A language used by an application which allows the retrieval, defnition and updating of databases. This language is typically SQL.
* Recovery control system - Stores previous states between transactions, which can be restored after failure.
* User accessible catalog - Provides information about the database.

## Advantages
##### Control of data redundency 
Eliminates data redundency by intergrated files, so multiple instances of entities do not need to be stored in multiple places in the database. Note that redundency is not completely removed as in some cases, copies of entities in the database can be desired to better model relationships and to improve retrieval performance.

##### Data Consistency 
By reducing the number of copies of entities the risk of inconsistencies is reduced as changes made to an entity that only appears in the database once can be done in a single update statement. If the database stores an entity in multiple places, the update needs to be made on all copies of the entity to ensure everything is consistent. 

##### More information from the same amount of data
By integrating operational data, the organisation using the database may be able to obtain more data from the database.

##### Sharing of data
All users that have access to the data can make use of data from the database for their own requirements.

##### Improved data integrity
Constraints will keep data stored as well as relationships up to a desired standard. Eg Salary must be greater than 0, or a staff can only have 0-5 clients.

##### Improved Security
Allows only the users who have access to the database to use it.

##### Enforcement of Standards
Can ensure things like data being of the correct data type. 

##### Economy of Scale
DBMS are typically scalable, meaning they can grow as the organisation using it grows.

##### Balanced Conflicting Requirements
Can resolve conflicts between users if they are accessing the same data source.

##### Improved Accessibility and Responsiveness
Data retrieval is faster.

##### Improved Productivity 

##### Improved Maintenance through Data independence

##### Improved Concurrency

##### Improved backup and recovery services

## Disadvantages
##### Complex
##### Large
##### Expensive
Additional hardware costs, cost of conversion from file based to database based.

##### Performance
Performance drops as the database fills up.

##### Higher impact of a failure

