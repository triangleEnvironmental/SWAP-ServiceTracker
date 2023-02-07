<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/triangleEnvironmental/SWAP-ServiceTracker">
    <img src="https://raw.githubusercontent.com/triangleEnvironmental/SWAP-BackOffice/main/resources/doc/graphic.png" alt="Logo"  height="80">
  </a>

  <h3 align="center">SWAP Service Tracker</h3>

  <p align="center">
    An application for moderators to solve waste issues.
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#01-introduction">Introduction</a></li>
    <li><a href="#02-technologies">Technologies</a></li>
    <li><a href="#03-architecture">Architecture</a></li>
    <li><a href="#04-functionalities">Functionalities</a></li>
    <li><a href="#05-system-actors">System Actors</a></li>
    <li><a href="#06-relational-diagram">Relational Diagram</a></li>
    <li>
      <a href="#07-getting-started">Getting Started</a>
      <ul>
        <li><a href="#71-prerequisites">Prerequisites</a></li>
        <li><a href="#72-installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#08-notice">Notice</a>
      <ul>
        <li><a href="#81-project-structure">Project Structure</a></li>
		<li><a href="#82-about-getx">About GetX</a></li>
		<li><a href="#83-creating-a-model">Creating a model</a></li>
		<li><a href="#84-fastlane">Fastlane</a></li>
		<li><a href="#85-fcm">FCM</a></li>
		<li><a href="#86-using-existing-script">Using Existing Script</a></li>
		<li><a href="#87-switching-dev-or-prod">Switching Dev or Prod</a></li>
		<li><a href="#88-localization">Localization</a></li>
      </ul>
    </li>
  </ol>
</details>

## 01. Introduction

This project is a revamped version to improve three main objectives over the first version:

* **Flexibility**: access control configurable in database level, Geodata operate directly by query, Configurable settings,
* **Security**: Hashed password, Verify JWT, Middleware, Permission checked, Activity Log
* **Complexity**: Server-side marker clustering, Pagination, infinite scroll, lazy load.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 02. Technologies

* **Flutter 3** : for developing Waste Tracker and Service Tracker mobile apps.
* **Firebase** : for Waste Tracker app authentication and push notification
* **Google Map** : for map view on back-office, Waste Tracker app and Service Tracker app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 03. Architecture

![Architecture.svg](https://raw.githubusercontent.com/triangleEnvironmental/SWAP-BackOffice/main/resources/doc/Architecture.svg)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 04. Functionalities

* Authentication
  * Login with E-mail and Password
  * Logout
  * Forgot password
* Profile Management
  * View profile
  * Edit profile
  * Change password
* Reports Management
  * Report list view
  * Report map view
  * Fitler reports
  * Preview report in popup on map
  * View report details
  * Home page view
* Report Moderation
  * Get direction on Google Map
  * Update report status
  * Comment on a report
  * Delete a report
  * Delete a comment
  * Show notification that has been sent when update report status
* Notification
  * Receive notification when user is assigned to a report by another user
* Report Assignment
  * View current assigned user on report detail
  * Unassign/Assign a user to a report
  * View list of reports assigned to current user
* My Moderation History
* Settings
  * Change language
* Terms of Service Page
* Privacy Policy Page
* About Page

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 05. System Actors

* **Super Administrator**: System admin who can manage overall configuration, sectors, FAQs, Institution, Users, etc.
* **Institutional Administrator**: Manage data in scope of their own institution includes adding service areas, manage users inside the same institution (Service provider, municipality)
* **Institutional Member**: Inside a service provider or municipality, members can moderate reports and send notification to citizens whose location is within the service area.
* **Citizen**: Users who use Waste Tracker app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 06. Relational Diagram

![Architecture.svg](https://raw.githubusercontent.com/triangleEnvironmental/SWAP-BackOffice/main/resources/doc/ER.svg)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 07. Getting Started

### 7.1. Prerequisites

* Flutter 3.3.0 or above
* Xcode 13 or above
* Fastlane

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### 7.2. Installation

* Repo: https://github.com/triangleEnvironmental/SWAP-ServiceTracker
* Copy keystore file
* Copy Android/key.properties
* Fastlane need to re-setup due to different developer account
* Edit constants/strings.dart -> devUrl -> 192.168.0.3 (Your API URL)
* Generate SHA1 or SHA256 to firebase projects (dev/prod)
* In case setup new firebase project for dev, change project ID in `./switch-dev.sh` and run the script (if not yet login, run `firebase login –reauth`)
* On iOS, go to `ios/Runner/GoogleService-Info.plist`, copy the value of `REVERSED_CLIENT_ID`, then add a dict to `CFBundleURLTypes` in `info.plist`

```xml
<dict>
  <key>CFBundleTypeRole</key>
  <string>Editor</string>
  <key>CFBundleURLName</key>
  <string>com.swaplistenapp</string>
  <key>CFBundleURLSchemes</key>
  <array>
     <string>....</string>
  </array>
  <key>CFBundleURLTypes</key>
  <array>
    <dict>
       <key>CFBundleTypeRole</key>
          <string>Editor</string>
          <key>CFBundleURLName</key>
          <string>com.swaplistenapp</string>
          <key>CFBundleURLSchemes</key>
          <array>
             <string>[PASTE THE VALUE HERE WITHOUT BRACKET]</string>
          </array>
    </dict>
 </array>
</dict>
```

* `flutter pub get`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 08. Notice

#### 8.1. Project Structure
This project uses **Getx** as a mini framework.

#### 8.2. About GetX

* Check more here https://pub.dev/packages/get.

#### 8.3. Creating a Model

* **Serialization** : We use `freeze` for model class code generation.
* **Generate files**
```shell
flutter packages pub run build_runner watch --delete-conflicting-outputs
```
* **Register adapter**: Inside `lib/app/globals/dependency.dart` in function `inject()`, append `..registerAdapter([ModelName]Adapter())` to `Hive`

* **Register serialize**: Add the new model to `T deserialize<T>(Map<String, dynamic> data)` function in `lib/app/utils/serialization.dart`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### 8.4. Fastlane

To automate deployment process, we use **Fastlane**. For more information, check https://docs.fastlane.tools/getting-started/cross-platform/flutter/.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### 8.5. FCM

As requirement, we need to add SHA signature to firebase project. To get SHA signature, execute the following commands:

```shell
cd android && ./gradlew signingreport
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### 8.6. Using Existing Script

* `./set_build_increase.sh`: to increase build number
* `./set_version.sh [version number]`: to set version number
* `./switch_dev.sh`: to switch environment, API url and firebase project to development
* `./switch_prod.sh`: to switch environment, API url and firebase project to production mode. It is ready to deploy.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### 8.7. Switching Dev or Prod

If you are setting up this project for the first time, you need to login Firebase in your terminal first.
Please check (firebase login https://firebase.google.com/docs/cli).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

#### 8.8. Localization

* To add a new translation word:
  * Add the new word to language files in `lib/locales/[language_code].dart`
  * Register the translation key to `lib/locales/index.dart` by add `ttr` after the translation key string.
* To add a new translation language:
  * In `main.dart`, add `supportedLocales` to `GetMaterialApp()`
  * Create a new language file in `lib/locales/[new_language_code].dart`
  * Import the new translation file to `AppTranslations` class in `lib/app/utils/translations.dart`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/triangleEnvironmental/SWAP-ServiceTracker.svg?style=for-the-badge
[contributors-url]: https://github.com/triangleEnvironmental/SWAP-ServiceTracker/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/triangleEnvironmental/SWAP-ServiceTracker.svg?style=for-the-badge
[forks-url]: https://github.com/triangleEnvironmental/SWAP-ServiceTracker/network/members
[stars-shield]: https://img.shields.io/github/stars/triangleEnvironmental/SWAP-ServiceTracker.svg?style=for-the-badge
[stars-url]: https://github.com/triangleEnvironmental/SWAP-ServiceTracker/stargazers
[issues-shield]: https://img.shields.io/github/issues/triangleEnvironmental/SWAP-ServiceTracker.svg?style=for-the-badge
[issues-url]: https://github.com/triangleEnvironmental/SWAP-ServiceTracker/issues
[license-shield]: https://img.shields.io/github/license/triangleEnvironmental/SWAP-ServiceTracker.svg?style=for-the-badge
[license-url]: https://raw.githubusercontent.com/triangleEnvironmental/SWAP-ServiceTracker/main/LICENSE