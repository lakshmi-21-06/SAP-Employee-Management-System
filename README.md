# SAP ABAP Employee Management System

A mini Employee Management System developed using SAP ABAP and Eclipse ADT.

## Project Overview

This project manages employee information, leave requests, and attendance records using custom SAP database tables and ABAP programming.

## Technologies Used

- SAP ABAP
- Eclipse ADT
- ABAP Dictionary
- Open SQL
- CDS Views
- Object-Oriented ABAP

## Repository Objects

### Database Tables
- ZEMPLOYEETAB
- ZLEAVETAB
- ZATTENDANCETAB

### CDS Views
- ZC_EMPLOYEE
- ZC_LEAVE
- ZC_ATTENDANCE

### Structures
- ZEMPLOYEE_STR1
- ZLEAVE_STR1

### Table Types
- ZEMPLOYEE_TT1
- ZLEAVE_TT1

### ABAP Class
- ZCL_EMPLOYEE_MANAGER

### ABAP Report
- ZEMPLOYEE_REPORT

## Features

- Create employee records
- Search employee by Employee ID
- Automatically retrieve employee details
- Create leave requests
- Record employee attendance
- Present/Absent selection
- Persistent database storage
- Employee data retrieval using Open SQL
- Object-oriented ABAP implementation

## Project Structure

```text
SAP-Employee-Management-System
│
├── CDS
├── Classes
├── Reports
├── Structures
├── Tables
└── Table_Types
