# RaceDay - Part 1: System Planning and Database

## System description

RaceDay is a full-stack, API-driven event management system built for the South African road running, walking, and cycling community (events like park runs, charity walks, and cycle tours). Event Organisers create and manage events, categories, and results; Participants browse events, enter categories, and track their personal results and enrolment history. This repository contains the Part 1 deliverables: the system plan (ERD and API endpoint plan) and the SQL database script. No application code is written in this part.

## Roles

- **Organiser** - creates, edits, and deletes events; manages event categories; captures participant results; views all enrolments for their events.
- **Participant** - creates an account; browses events; enters an event by selecting a category; views their own enrolments; tracks their personal results.

Role-based access is planned at the API level in this endpoint plan and will be enforced in Part 2.

## Contents (/docs)

| File | Purpose |
|---|---|
| `docs/erd.dot` | Graphviz source for the ERD |
| `docs/ERD.png` | Entity Relationship Diagram (6 entities, PKs/FKs and cardinality shown) |
| `docs/API-Endpoint-Plan.md` | Full API endpoint plan (Section B) |
| `docs/RaceDay_Database.sql` | SQL Server script: schema + seed data (Section C) |

## Entities

Users, Events, Categories, Routes, Enrolments, Results.

- A **User** (Organiser) creates many **Events**.
- An **Event** has many **Categories** and exactly one **Route**.
- A **User** (Participant) makes many **Enrolments**; an **Enrolment** links one Participant to one Category (many-to-many resolved via the junction table).
- Each **Enrolment** produces at most one **Result**.

The SQL script in `docs/RaceDay_Database.sql` matches the ERD exactly 

## Running the SQL script

1. Open SQL Server Management Studio (SSMS) and connect to a clean SQL Server instance.
2. Open `docs/RaceDay_Database.sql`.
3. Execute the script. It drops and recreates `RaceDayDB`, creates all six tables with primary keys, foreign keys, and constraints, then seeds:
   - 2 Organisers, 2 Participants
   - 3 Events, each with a Route
   - 5 Categories across the 3 events
   - 4 sample Enrolments and 2 sample Results

## GitHub Actions / CI

A workflow at `.github/workflows/validate-structure.yml` runs on every push/PR to `main` and checks that the `/docs` folder exists and contains `ERD.png`, `API-Endpoint-Plan.md`, and `RaceDay_Database.sql`.

**[CI screenshot placeholder]**
 - after pushing this repo to GitHub, I will replace this line with a screenshot of the green (passing) Actions build. On the **Actions** tab on GitHub, i will open the latest successful run, and paste a screenshot here.<img width="1600" height="764" alt="image" src="https://github.com/user-attachments/assets/854b11e5-a92e-43cb-8d60-f557d83eab5c" />


## Video presentation

**[Video link placeholder]**   - this part also requires a short video walking through my ERD decisions, endpoint plan choices, and running the SQL script live in SSMS. Record it and paste the link here before submitting.
https://youtu.be/IZk6nK_upWc 

## Commit history for this part

Built incrementally, one logical unit of work per commit (repo scaffolding, ERD, CI workflow, each API plan section, each database table, each seed data group, then this README) - see `git log --oneline` for the full list.
