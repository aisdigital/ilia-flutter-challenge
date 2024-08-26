# ILIA Flutter Challenge

This project is a Flutter-based mobile application developed as part of the ILIA Flutter Challenge. The application is designed to list movies that are playing right now on theaters, including their details and trailers.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Overview

The ILIA Flutter Challenge app is a demonstration of best practices in Flutter development, including state management, dependency injection and networking. The app is designed to be scalable and maintainable, with a focus on clean architecture.

## Features

- **State Management:** Implemented using `flutter_bloc`.
- **Dependency Injection:** Managed using `get_it`.
- **Networking:** Handled with `Dio` for HTTP requests.
- **Clean Architecture:** Separation of concerns with clearly defined layers (Data, Domain, Presentation).

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code with Flutter plugins

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/AnadinhoAd/ilia-flutter-challenge.git
   cd ilia-flutter-challenge
   
2. Create a .env file on the root of your project:\
![image](https://github.com/user-attachments/assets/18cef225-9e0c-4e1e-a0ac-5e882920e93d)

3. Inside this .env file, set a variable named API_KEY:\
![image](https://github.com/user-attachments/assets/a06f87c4-9f3f-4faf-a118-c70f2ecaefe9)

4. Get your api key from https://developer.themoviedb.org/docs/getting-started

5. Now replace 'yourapikey' value with your actual API Key

6. Now run the command:
   ```bash
   flutter pub get

7. And run the project with vscode or build it to install in a device
