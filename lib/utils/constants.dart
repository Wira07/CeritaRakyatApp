class AppConstants {
  static const String appName = 'Cerita Rakyat Nusantara';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Pembelajaran Menyimak Berbasis AI';

  // Audio constants
  static const Duration defaultAudioDuration = Duration(minutes: 8, seconds: 30);
  static const Duration seekDuration = Duration(seconds: 10);

  // Quiz constants
  static const int passingScore = 7;
  static const int maxQuestions = 10;

  // Categories
  static const List<String> storyCategories = [
    'Semua',
    'Legenda',
    'Dongeng',
    'Fabel',
    'Mitos'
  ];

  // Regions
  static const List<String> indonesianRegions = [
    'Sumatera Utara',
    'Sumatera Barat',
    'Riau',
    'Jambi',
    'Sumatera Selatan',
    'Bengkulu',
    'Lampung',
    'Kepulauan Bangka Belitung',
    'Kepulauan Riau',
    'DKI Jakarta',
    'Jawa Barat',
    'Jawa Tengah',
    'DI Yogyakarta',
    'Jawa Timur',
    'Banten',
    'Bali',
    'Nusa Tenggara Barat',
    'Nusa Tenggara Timur',
    'Kalimantan Barat',
    'Kalimantan Tengah',
    'Kalimantan Selatan',
    'Kalimantan Timur',
    'Kalimantan Utara',
    'Sulawesi Utara',
    'Sulawesi Tengah',
    'Sulawesi Selatan',
    'Sulawesi Tenggara',
    'Gorontalo',
    'Sulawesi Barat',
    'Maluku',
    'Maluku Utara',
    'Papua',
    'Papua Barat',
  ];
}
