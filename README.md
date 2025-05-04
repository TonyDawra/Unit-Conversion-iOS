# iOS Unit Conversion App

A simple and intuitive iOS application for converting between different units of measurement.

## Overview

This Unit Conversion App provides users with a straightforward interface to convert between various units of measurement including length, weight, temperature, and scale. The app features a clean design and easy-to-use controls, making unit conversion quick and hassle-free.

## Features

- **Multiple Conversion Types**:
  - Length (cm to m, m to cm)
  - Scale (inches to feet, feet to inches)
  - Temperature (implied by TemperatureViewController reference)
  - Weight (implied by WeightViewController reference)

- **User-Friendly Interface**:
  - Simple input fields
  - Unit selection via picker views
  - Clear result display

- **App Information**:
  - About screen with app description
  - Visitor counter to track usage
  - App logo display

## Screens

### Main Selection Screen
The main screen allows users to select the type of conversion they want to perform:
- Length Conversion
- Weight Conversion
- Temperature Conversion
- Scale Conversion
- App Information

### Length Conversion
- Convert between centimeters and meters
- Two-way conversion with picker for selecting direction
- Input field for entering values
- Result display showing converted values with precision

### Scale Conversion
- Convert between inches and feet
- Two-way conversion with picker for selecting direction
- Input field for entering values
- Result display showing converted values with precision

### Information Screen
- Displays app logo
- Shows visitor count (tracked across app sessions)
- Provides information about the app's purpose and functionality

## Technical Details

### Dependencies
- UIKit framework
- Foundation framework

### Architecture
- **Model-View-Controller (MVC)** design pattern
- View controllers for each conversion type
- Data persistence using NSUserDefaults for visitor counting

### Key Components

- **AppDelegate**: Manages application lifecycle
- **ViewController**: Main controller for the selection interface
- **LengthViewController**: Handles length conversions (cm ↔ m)
- **ScaleViewController**: Handles scale conversions (inches ↔ feet)
- **WeightViewController**: Handles weight conversions (implementation not shown)
- **TemperatureViewController**: Handles temperature conversions (implementation not shown)
- **InfoViewController**: Displays app information and tracks visitor count

## Installation

### Requirements
- iOS 13.0+
- Xcode 11.0+
- Swift 5.0+ (for any Swift components not shown in the code)

### Setup
1. Clone or download the repository
2. Open the .xcodeproj file in Xcode
3. Build and run the application on your device or simulator

## Usage

1. Launch the app
2. Select the desired conversion type from the main screen
3. Enter a value in the input field
4. Select the conversion direction using the picker view (e.g., cm to m or m to cm)
5. Tap the Convert button to see the result

## Data Persistence

The app uses NSUserDefaults to store and track the number of visitors who have used the app. This counter is incremented each time the information screen is viewed.

## Future Enhancements

Potential improvements for future versions:
- Additional unit conversions (volume, area, speed, etc.)
- Custom conversion factors
- History of recent conversions
- Dark mode support
- Localization for multiple languages
- iPad support with split view
- More sophisticated UI with animations
- Ability to share conversion results

