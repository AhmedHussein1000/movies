# Movies App

A Flutter application for browsing and searching movies, built with clean architecture and BLoC state management.

## Demo
[Watch the Demo](https://drive.google.com/file/d/16I-z4SNBD9l5udeN_vIw3eu56pbx9cRE/view?usp=drive_link)

## Features
- Browse Now Playing, Popular, and Top Rated Movies
- Search Movies by Title
- View Movie Details
- Infinite Scroll Pagination
- Dark Theme Support
- Responsive UI

## Screens
- Home Screen
- Search Screen
- Movie Details Screen
- Popular Movies Screen
- Top Rated Movies Screen

## Tech Stack
- **Flutter** - UI Framework
- **BLoC** - State Management
- **RxDart** - Reactive Programming
- **Cached Network Image** - Image Loading
- **Carousel Slider** - Movie Carousels
- **Skeletonizer** - Loading Placeholders

## Project Structure

```bash
lib/
├── core/
│   ├── cache/
│   ├── di/
│   ├── error/
│   ├── functions/
│   ├── helpers/
│   ├── network/
│   ├── routes/
│   ├── themes/
│   ├── usecase/
│   ├── utils/
│   └── widgets/
├── movies/
│   ├── data/
│       ├── data_source/
│       ├── models/
│       └── repository/
│   ├── domain/
│       ├── entities/
│       ├── repository/
│       └── usecases/
│   ├── presentation/
│       ├── controllers/
│       ├── screens/
│       └── widgets/
└── main.dart