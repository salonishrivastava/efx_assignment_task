# flutter_equifax_assignment

# Equifax Assignment - User Registration & Login POC

A Flutter application that  complete **User Registration & Login** workflow with a **5-Step Registration Wizard**, secure local data persistence, and a post-registration dashboard. The project is built using **Clean Architecture**, **BLoC State Management**, and the **Repository Pattern** to ensure scalability, maintainability, and modularity.



## 📱 Features

### Authentication
- Login using Employee ID/Login ID or Email
- Password visibility toggle
- Input validation
- Local authentication
- Error handling using SnackBars

### Registration Wizard
- Step 1 – Personal Information
- Step 2 – Education & Work Details
- Step 3 – Address Details
- Step 4 – Account Credentials
- Step 5 – Review & Submit

### Dashboard
- Welcome screen
- Profile details
- User information
- Profile editing
- Local user management



## Architecture

The project follows **Clean Architecture** with the **Repository Pattern**.


Presentation

 
Domain

  
Data



##  Tech Stack

- Flutter 3.27.1
- Dart
- flutter_bloc
- bloc
- equatable
- go_router
- shared_preferences

---

##  Project Structure


lib/
│
├── core/
│   ├── constants/
│   ├── routes/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│
│   └── auth/
│       ├── data/
│       │   ├── datasource/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
│
└── main.dart


##  Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_bloc:
  equatable:
  go_router:
  shared_preferences:




##  Getting Started

### Clone Repository

```bash
git clone https://github.com/salonishrivastava/efx_assignment_task.git
```

### Install Packages

```bash
flutter pub get
```

### Run Application

```bash
flutter run
```

---

##  Design Principles

- Clean Architecture
- Repository Pattern
- BLoC State Management
- Modular Folder Structure
- Reusable Widgets
- SOLID Principles
- Form Validation
- Responsive UI

---

##  Assignment Modules

- Login Screen
- Registration Wizard
- Local Data Persistence
- Dashboard
- Profile Management
- Form Validation
- Navigation using GoRouter

---

##  Developed By

**Saloni**

Flutter Assignment – User Registration & Login POC
