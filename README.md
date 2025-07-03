# 📖 Cerita Rakyat App

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android">
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS">
</div>

<div align="center">
  <h3>🌟 Preserving Indonesian Heritage Through Digital Storytelling 🌟</h3>
  <p><em>Bringing timeless Indonesian folk tales to the digital age</em></p>
</div>

---

## 🎯 About

**Cerita Rakyat App** is a beautifully crafted Flutter application dedicated to preserving and sharing the rich tradition of Indonesian folk tales. From the legendary tales of Malin Kundang to the wisdom of Sangkuriang, this app brings beloved stories to life for modern audiences.

### ✨ Key Features

- 📚 **Rich Story Collection** - Curated Indonesian folk tales from various regions
- 🎨 **Beautiful UI/UX** - Engaging and intuitive design for all ages
- 🔊 **Audio Narration** - Listen to stories with traditional Indonesian voice-over
- 🖼️ **Illustrated Stories** - Stunning artwork accompanying each tale
- 🌍 **Regional Diversity** - Stories from Java, Sumatra, Bali, and beyond
- 🔖 **Bookmarks** - Save your favorite stories for later
- 🌙 **Night Mode** - Comfortable reading in any lighting
- 📱 **Offline Reading** - Enjoy stories without internet connection

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (2.17.0 or higher)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ceritarakyatapp.git
   cd ceritarakyatapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### 🔧 Development Setup

```bash
# Check Flutter installation
flutter doctor

# Generate launcher icons
flutter pub run flutter_launcher_icons:main

# Build APK
flutter build apk --release

# Build iOS (macOS only)
flutter build ios --release
```

## 📱 Screenshots

<div align="center">
  <img src="screenshots/home_screen.png" width="200" alt="Home Screen">
  <img src="screenshots/story_list.png" width="200" alt="Story List">
  <img src="screenshots/reading_view.png" width="200" alt="Reading View">
  <img src="screenshots/audio_player.png" width="200" alt="Audio Player">
</div>

## 🏗️ Architecture

This project follows clean architecture principles:

```
lib/
├── core/               # Core utilities and constants
├── data/               # Data layer (repositories, models)
├── domain/             # Business logic layer
├── presentation/       # UI layer (screens, widgets)
├── shared/             # Shared components
└── main.dart          # App entry point
```

### 🛠️ Tech Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: Provider / Bloc
- **Local Storage**: Hive / SQLite
- **Audio**: Just Audio
- **Networking**: Dio
- **Testing**: Flutter Test

## 🎨 Design Philosophy

Our design is inspired by traditional Indonesian art and modern mobile UX principles:

- **Colors**: Warm earth tones reflecting Indonesian heritage
- **Typography**: Clean, readable fonts supporting Indonesian text
- **Illustrations**: Custom artwork inspired by wayang and batik patterns
- **Animation**: Smooth transitions that feel natural and engaging

## 🌟 Contributing

We welcome contributions from the community! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit your changes**: `git commit -m 'Add amazing feature'`
4. **Push to the branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

### 📝 Contribution Guidelines

- Follow the existing code style
- Write tests for new features
- Update documentation as needed
- Ensure your code passes all tests
- Add meaningful commit messages

## 🐛 Bug Reports & Feature Requests

Found a bug or have a feature request? Please create an issue on GitHub:

- [Report a Bug](https://github.com/yourusername/ceritarakyatapp/issues/new?template=bug_report.md)
- [Request a Feature](https://github.com/yourusername/ceritarakyatapp/issues/new?template=feature_request.md)

## 📚 Learning Resources

New to Flutter? Here are some helpful resources:

- [Flutter Documentation](https://docs.flutter.dev/) - Official Flutter docs
- [Flutter Cookbook](https://docs.flutter.dev/cookbook) - Practical examples
- [Dart Language Tour](https://dart.dev/guides/language/language-tour) - Learn Dart basics
- [Flutter YouTube Channel](https://www.youtube.com/flutterdev) - Video tutorials

## 🤝 Community

Join our community and connect with other developers:

- [Discord Server](https://discord.gg/your-server)
- [Telegram Group](https://t.me/your-group)
- [Instagram](https://instagram.com/ceritarakyatapp)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Indonesian Ministry of Culture** for preserving folk tales
- **Flutter Team** for the amazing framework
- **Contributors** who help make this project better
- **Traditional storytellers** who keep these tales alive

---

<div align="center">
  <p>Made with ❤️ for preserving Indonesian culture</p>
  <p>
    <a href="https://flutter.dev">
      <img src="https://img.shields.io/badge/Built%20with-Flutter-blue?style=flat-square&logo=flutter" alt="Built with Flutter">
    </a>
    <a href="https://github.com/yourusername/ceritarakyatapp/stargazers">
      <img src="https://img.shields.io/github/stars/yourusername/ceritarakyatapp?style=flat-square" alt="GitHub stars">
    </a>
    <a href="https://github.com/yourusername/ceritarakyatapp/network">
      <img src="https://img.shields.io/github/forks/yourusername/ceritarakyatapp?style=flat-square" alt="GitHub forks">
    </a>
  </p>
</div>

---

<div align="center">
  <h3>🌸 "Setiap cerita memiliki jiwa, dan jiwa itu hidup dalam hati yang mendengarkan" 🌸</h3>
  <p><em>"Every story has a soul, and that soul lives in the heart of those who listen"</em></p>
</div>