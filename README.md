# 🚗 BLoC Vehicle Management System

A Flutter application that manages different types of vehicles using the BLoC (Business Logic Component) pattern.

## 📌 Features

- Add vehicles (Car, Truck, Motorcycle)
- Store and retrieve data using local JSON storage
- Search vehicles by:
  - Manufacturer
  - Plate number
  - Manufacture date
- Separation of concerns using:
  - BLoC for state management
  - Repository for data handling
  - Models with JSON serialization

## 🏗️ Architecture

- BLoC Pattern
- Repository Pattern
- Clean separation of UI, logic, and data

## 🧰 Technologies Used

- Flutter
- Dart
- flutter_bloc
- JSON file storage

## 📂 Project Structure

- bloc/
- models/
- repository/
- screens/

## 🚀 Getting Started

```bash
flutter pub get
flutter run
