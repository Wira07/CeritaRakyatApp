plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.ceritarakyatapp"
    compileSdk = 35 // Use the appropriate SDK version, or link it to flutter.compileSdkVersion if you prefer.

    // Set the NDK version explicitly to match the required version
    ndkVersion = "21.4.7075529" // This is a more stable version; you may use 27 if it's required for your project

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.ceritarakyatapp"
        minSdk = 21
        targetSdk = 33 // Ensure it matches flutter.targetSdkVersion
        versionCode = 1 // Replace with appropriate version code
        versionName = "1.0.0" // Replace with appropriate version name
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug") // Use the appropriate signing configuration
        }
    }
}

flutter {
    source = "../.." // Ensure the correct path to the Flutter project
}
