🏥 Medical Management System

Rails 8 | Production-Ready | Modular Healthcare Platform

📌 Overview

This is a full-stack Medical Management System built using Ruby on Rails 8, designed for clinics and hospitals.

The system is:

Secure (authentication + authorization)

Auditable (medical-grade logging)

Modular (feature-by-feature)

Scalable (enterprise Rails architecture)

Built with real healthcare workflows in mind

⚠️ This is not a demo app.
It follows real hospital system standards.

🚀 Current Status (Modules Completed)
Module	Status
User & Role Management	✅ Completed
Patient Management	✅ Completed
Doctor Management	✅ Completed
Appointment Scheduling	⏳ Next
Prescription Management	⏳ Pending
Laboratory	⏳ Pending
Pharmacy	⏳ Pending
Billing	⏳ Pending
Notifications	⏳ Pending
File Uploads	⏳ Pending
Admin Dashboard	⏳ Pending
🧱 Tech Stack
Core

Ruby on Rails 8

PostgreSQL

Redis

Gems Used

Devise → Authentication

Pundit → Authorization (RBAC)

PaperTrail → Audit logs

Sidekiq → Background jobs (ready)

ActiveAdmin → Admin dashboard (installed)

RSpec → Testing framework

🔐 Security Architecture (Very Important)
Authentication

Managed by Devise

Secure password hashing

Session handling

Login / logout / recovery

Authorization (RBAC)

Implemented using Pundit

Every controller action is authorized

Policies define who can do what

Audit Logs

PaperTrail tracks:

Role changes

Patient updates

Doctor updates

Required for medical compliance

Soft Deletes

No patient or doctor is ever deleted

Records are archived (active = false)

👥 User & Role Management (Module 1)
Roles Supported

Admin

Doctor

Nurse

Receptionist

Lab Technician

Pharmacist

Accountant

Patient

How It Works

All users authenticate via Devise

Role is stored as an enum on users

Access is controlled via policies

Only admins can manage users

Example

Admin creates a doctor user

Doctor logs in using that user account

Permissions are role-based, not hardcoded

🧑‍🤝‍🧑 Patient Management (Module 2)
Purpose

Handles patient identity and demographics.

What Is Stored

Name

Date of birth

Gender

Phone

Address

Blood group

Emergency contact

Key Rules

Patient must belong to a user

DOB cannot be in the future

Patients are never deleted

Only authorized staff can create/update

Who Can Do What
Role	Permission
Receptionist	Create patient
Doctor / Nurse	Update patient
Admin	Archive patient
Others	No access
👨‍⚕️ Doctor Management (Module 3)
Purpose

Manages doctors as licensed medical professionals.

What Is Stored

Name

Specialization

Medical license number (unique)

Contact info

Active status

Medical Compliance

License number is unique

Changes are audited

Doctors cannot be deleted

Who Can Do What
Role	Permission
Admin	Create / Update / Deactivate
Doctor	View doctors
Receptionist	View doctors
Others	No access
🗂 Database Structure (So Far)
Users

Authentication & roles

Patients

Linked to users

Demographic info

Doctors

Linked to users

License & specialization

Audit Tables

Managed by PaperTrail

🧪 Testing Strategy

We use RSpec with:

Model specs (validations, enums, scopes)

Policy specs (RBAC rules)

Request specs (real HTTP flows)

Why This Matters

Prevents unauthorized access

Protects medical data

Ensures safe refactoring

Run tests:

bundle exec rspec

🔁 Git Workflow (Mandatory)
Branch Strategy

main → production

develop → integration

feature/* → isolated modules

Example Flow
git checkout develop
git pull origin develop
git checkout -b feature/patient-management
git add .
git commit -m "Add patient management"
git push origin feature/patient-management

Why This Is Critical

Safe releases

Easy rollback

Clear code reviews

Medical systems require traceability

▶️ How to Run Locally
bundle install
rails db:create
rails db:migrate
rails server


Visit:

http://localhost:3000

🧠 Architectural Principles Followed

Thin controllers

No fat models

Service objects for business logic

RESTful routing

No hardcoded permissions

Separation of concerns

Audit-first design

🚧 What’s Coming Next

Module 4: Appointment Scheduling

Doctor availability

Time slots

Conflicts prevention

Patient ↔ doctor linking