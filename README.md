# 💼 Nouman Farooq — Personal Portfolio App & Web

A modern, high-performance responsive **Portfolio Application and Website** built from the ground up using **Flutter** and deployed on **Firebase Hosting**. Designed with an adaptive layout that delivers an optimal viewing and interactive experience across both Desktop/Web and Mobile devices.

[![Flutter](https://img.shields.io/badge/Flutter-3.13+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.13+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Hosting%20%7C%20Firestore-FFA611?logo=firebase&logoColor=white)](https://firebase.google.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20Android%20%7C%20iOS-brightgreen)](https://nouman-knop.web.app)

---

## 🌐 Live Website

Experience the live deployed web version:  
👉 **[nouman-knop.web.app](https://nouman-knop.web.app)** *(Hosted on Firebase)*

---

## ✨ Key Features

- 📱 **Adaptive Cross-Platform UI**: Dedicated responsive layouts tailored specifically for Desktop Web (`lib/web/`) and Mobile screens (`lib/mobile/`).
- 🚀 **Interactive Sections**:
  - **Hero / Landing Page**: Engaging introduction with animated CTA and social links.
  - **About Me**: Professional summary, tech stack proficiencies, and developer journey.
  - **Works / Portfolio**: Detailed project showcases highlighting mobile and web apps.
  - **Tech Blog**: Insights and articles on mobile development.
  - **Contact Form**: Interactive message submission integrated directly with `Cloud Firestore`.
- 🎨 **Modern Design & Aesthetics**:
  - Sleek typography powered by `Google Fonts`.
  - Scalable vector graphics (`flutter_svg`) for crisp rendering at all screen resolutions.
  - Smooth custom route navigation (`routes.dart`).
- ⚡ **SEO & URL Strategy**: Configured with `url_strategy` for clean, bookmarkable browser URLs without `#` hashes.

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev/) (Web & Mobile)
- **Language**: [Dart](https://dart.dev/)
- **Hosting & Backend**: [Firebase Hosting](https://firebase.google.com/docs/hosting) & [Cloud Firestore](https://firebase.google.com/docs/firestore)
- **Key Packages**:
  - `firebase_core: ^4.15.0`
  - `cloud_firestore: ^6.10.0`
  - `google_fonts: ^8.2.1`
  - `flutter_svg: ^2.3.0`
  - `url_launcher: ^6.3.2`
  - `url_strategy: ^0.3.0`
  - `logger: ^2.8.0`

---

## 📂 Project Architecture

```text
lib/
├── firebase_options.dart      # Platform Firebase configuration
├── main.dart                  # App initialization, Firebase setup & Theme
├── routes.dart                # Named routing for Web & Mobile
├── components.dart            # Reusable UI widgets, buttons & cards
├── web/                       # Desktop / Large screen views
│   ├── landing_page_web.dart
│   ├── about_web.dart
│   ├── works_web.dart
│   ├── blog_web.dart
│   └── contact_web.dart
└── mobile/                    # Mobile / Compact screen views
    ├── landing_page_mobile_.dart
    ├── about_mobile.dart
    ├── works_mobile.dart
    ├── blog_mobile.dart
    └── contact_mobile.dart
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed (v3.13+)
- Chrome / Edge browser (for Web) or Android/iOS device
- [Firebase CLI](https://firebase.google.com/docs/cli) (optional, for deployment)

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Nouman-Khattak/nouman_knop.git
   cd nouman_knop
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run on Web:**
   ```bash
   flutter run -d chrome
   ```

4. **Run on Mobile:**
   ```bash
   flutter run
   ```

---

## ☁️ Deployment (Firebase Hosting)

To build and deploy updates to Firebase Hosting:

```bash
flutter build web --release
firebase deploy --only hosting
```

---

## 👤 Author

- **Nouman Farooq**
- Email: [nouman.khattak00@gmail.com](mailto:nouman.khattak00@gmail.com)
- GitHub: [@Nouman-Khattak](https://github.com/Nouman-Khattak)
- Live Portfolio: [nouman-knop.web.app](https://nouman-knop.web.app)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
