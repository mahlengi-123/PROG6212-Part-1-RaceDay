
# RaceDay - Part 1: System Planning and Database

## Portfolio of Evidence (PoE)

RaceDay is a web-based event management system designed for the South African running, walking, and cycling community.

The system allows **Organisers** to create and manage events, categories, participant enrolments, and race results. **Participants** can create accounts, browse events, enter event categories, view their enrolments, and track their personal results.

This repository contains the completed work for:

**PROG6212 - Part 1: System Planning and Database**

## Part 1 Overview

Part 1 focused on planning the RaceDay system before application development begins.

The work completed includes:

- Entity Relationship Diagram (ERD)
- API Endpoint Plan
- SQL Server Database Script
- Sample Database Data
- Role-based System Design
- GitHub Repository Structure
- GitHub Actions CI/CD Validation
- README Documentation
- YouTube Walkthrough

## User Roles

RaceDay supports two main user roles.

### Organiser

The Organiser is responsible for managing RaceDay events.

An Organiser can:

- Create events
- Edit events
- Delete events
- Manage event categories
- View event enrolments
- Capture participant results
- Update participant results

### Participant

A Participant is a user who enters RaceDay events.

A Participant can:

- Create an account
- Log in
- View and update their profile
- Browse available events
- View event categories
- Enter an event category
- View their own enrolments
- Track their personal race results

## Database Design

The RaceDay database was created using **Microsoft SQL Server** and tested using **SQL Server Management Studio (SSMS)**.

The database is called:

`RaceDayDB`

The database contains six main tables:

1. Organiser
2. Participant
3. Event
4. Category
5. Enrolment
6. Result

## Database Relationships

The main relationships in the database are:

```text
Organiser   1 -------- 0..* Event

Event       1 -------- 0..* Category

Participant 1 -------- 0..* Enrolment

Category    1 -------- 0..* Enrolment

Enrolment   1 -------- 0..1 Result
````

One Organiser can manage multiple Events, while each Event belongs to one Organiser.

One Event can contain multiple Categories, while each Category belongs to one Event.

A Participant can have multiple Enrolments, and a Category can also have multiple Enrolments.

The Enrolment table connects Participants to event Categories.

An Enrolment can have zero or one Result because a participant may enrol before a race result exists.


## Entity Relationship Diagram

The completed RaceDay Entity Relationship Diagram can be found in:

`docs/RaceDay_ERD.png`

The ERD includes:

* All six database entities
* Attributes
* Primary keys
* Foreign keys
* Relationships
* Cardinalities

The SQL database structure was designed to match the ERD.



## API Endpoint Plan

The API Endpoint Plan was created before API implementation.

The plan covers:

* Authentication
* Registration
* Login
* User Profiles
* Events
* Categories
* Event Enrolments
* Results

Each endpoint contains the following six columns:

* HTTP Method
* Route
* Description
* Role Required
* Request Body
* Expected Response

The API plan uses RESTful HTTP methods such as:

* `GET` to retrieve information
* `POST` to create information
* `PUT` to update information
* `DELETE` to remove information

The plan also includes success and failure HTTP response codes such as:

* `200 OK`
* `201 Created`
* `204 No Content`
* `400 Bad Request`
* `401 Unauthorized`
* `403 Forbidden`
* `404 Not Found`
* `409 Conflict`

The completed API Endpoint Plan can be found in:

`docs/RaceDay_API_Endpoint_Plan.pdf`



## SQL Database Script

The complete SQL Server database script can be found in:

`docs/RaceDay_Database.sql`

The script includes:

* Database creation
* `CREATE TABLE` statements
* Primary keys
* Foreign keys
* `NOT NULL` constraints
* `UNIQUE` constraints
* `DEFAULT` constraints
* Sample `INSERT` statements
* Test `SELECT` statements

The SQL script was tested successfully in SQL Server Management Studio.


## Sample Data

The RaceDay database contains realistic sample data.

| Table       | Number of Records |
| ----------- | ----------------: |
| Organiser   |                 2 |
| Participant |                 2 |
| Event       |                 3 |
| Category    |                 6 |
| Enrolment   |                 4 |
| Result      |                 2 |

The sample events include:

* Durban Beach Run
* Umhlanga Charity Walk
* Cape Town Cycle Challenge


## Database Setup Instructions

### Requirements

The following software is required:

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)

### Setup Steps

1. Open SQL Server Management Studio.
2. Connect to your SQL Server instance.
3. Open the following SQL file:

`docs/RaceDay_Database.sql`

4. Click **Execute**.
5. The script creates `RaceDayDB` if the database does not already exist.
6. The six RaceDay tables are created.
7. The required constraints and relationships are created.
8. Sample data is inserted.
9. Refresh the **Databases** section in Object Explorer.
10. Expand `RaceDayDB`.
11. Expand **Tables**.

The following tables should appear:

```text
dbo.Organiser
dbo.Participant
dbo.Event
dbo.Category
dbo.Enrolment
dbo.Result
```

## Testing the Database

The following queries can be used to view the sample data:

```sql
USE RaceDayDB;
GO

SELECT * FROM Organiser;
SELECT * FROM Participant;
SELECT * FROM Event;
SELECT * FROM Category;
SELECT * FROM Enrolment;
SELECT * FROM Result;
```

The following queries can be used to check the number of records:

```sql
SELECT COUNT(*) AS Organisers FROM Organiser;
SELECT COUNT(*) AS Participants FROM Participant;
SELECT COUNT(*) AS Events FROM Event;
SELECT COUNT(*) AS Categories FROM Category;
SELECT COUNT(*) AS Enrolments FROM Enrolment;
SELECT COUNT(*) AS Results FROM Result;
```

Expected results:

```text
Organisers     2
Participants   2
Events         3
Categories     6
Enrolments     4
Results        2
```


## Repository Structure

```text
RaceDay/
│
├── README.md
│
├── docs/
│   ├── RaceDay_ERD.png
│   ├── RaceDay_API_Endpoint_Plan.pdf
│   ├── RaceDay_Database.sql
│   └── CI_CD_Success.png
│
└── .github/
    └── workflows/
        └── validate-docs.yml

## GitHub Actions CI/CD

GitHub Actions is used to automatically validate the required Part 1 repository files.

The workflow checks that the repository contains:

* `README.md`
* `docs/RaceDay_ERD.png`
* `docs/RaceDay_API_Endpoint_Plan.pdf`
* `docs/RaceDay_Database.sql`

The workflow file is stored in:

`.github/workflows/validate-docs.yml`

The GitHub Actions workflow completed successfully.


### Successful CI/CD Build

![Successful CI/CD Build](docs/CI_CD_Success.png)





## YouTube Walkthrough

An unlisted YouTube presentation demonstrates the completed RaceDay Part 1 work.

The video includes:

* RaceDay system overview
* ERD design decisions
* Database relationships and cardinalities
* API Endpoint Plan choices
* SQL database design
* SQL script running live in SSMS
* Sample database results
* GitHub repository
* Successful GitHub Actions CI/CD workflow

### YouTube Video Link

[Watch the RaceDay Part 1 Presentation on YouTube](https://youtu.be/IZk6nK_upWc)
 Success

## Part 1 Documentation

| Document                    | Location                             |
| --------------------------- | ------------------------------------ |
| Entity Relationship Diagram | `docs/RaceDay_ERD.png`               |
| API Endpoint Plan           | `docs/RaceDay_API_Endpoint_Plan.pdf` |
| SQL Database Script         | `docs/RaceDay_Database.sql`          |
| CI/CD Evidence              | `docs/CI_CD_Success.png`             |



## Part 1 Completion Status

* [x] Database designed
* [x] Six database tables created
* [x] Primary keys implemented
* [x] Foreign keys implemented
* [x] Database relationships created
* [x] Cardinalities documented
* [x] Sample data inserted
* [x] SQL script tested successfully
* [x] ERD completed
* [x] API Endpoint Plan completed
* [x] GitHub repository created
* [x] GitHub Actions workflow created
* [x] CI/CD validation successful
* [x] CI/CD screenshot added
* [ x] YouTube video link added to README



## Conclusion
Part 1 of the RaceDay project has been completed successfully.

The Entity Relationship Diagram, API Endpoint Plan, SQL database schema, sample data, and CI/CD workflow provide the planning foundation for the next stage of the RaceDay system.

Part 2 will focus on implementing the RaceDay API according to the planning completed during Part 1.

