# RaceDay - Part 1

## Portfolio of Evidence

RaceDay is a web-based event management system designed for the South African running, walking, and cycling community.

The purpose of RaceDay is to provide a system where Organisers can create and manage events, categories, participant enrolments and race results, while Participants can browse events, enter event categories, view their enrolments and track their personal results.

This repository contains the completed work for:

**PROG6212 - Part 1: System Planning and Database**


## Part 1 Overview

Part 1 focused on planning the RaceDay system before application development begins.

The completed work includes:

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

An Organiser is responsible for managing RaceDay events.

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

The RaceDay database was created using Microsoft SQL Server and tested using SQL Server Management Studio (SSMS).

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

The main relationships are:

```text
Organiser   1 -------- 0..* Event

Event       1 -------- 0..* Category

Participant 1 -------- 0..* Enrolment

Category    1 -------- 0..* Enrolment

Enrolment   1 -------- 0..1 Result
