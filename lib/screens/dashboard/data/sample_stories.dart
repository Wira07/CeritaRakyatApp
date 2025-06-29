import '../../../models/story_model.dart';

class SampleStories {
  static List<Story> getStories() {
    return [
      Story(
        id: '1',
        title: 'Malin Kundang',
        region: 'Sumatera Barat',
        category: 'Legenda',
        description: 'Kisah tentang anak durhaka yang dikutuk menjadi batu',
        audioUrl: 'assets/audio/malin_kundang.mp3',
        imageUrl: 'assets/images/malin_kundang.jpg',
        duration: Duration(minutes: 8, seconds: 30),
        wisdom: 'Berbakti kepada orang tua adalah kewajiban yang mulia',
        fullStory: '',
        characters: ['Malin', 'Ibu', 'Batu'],
        setting: 'Pantai',
      ),
      Story(
        id: '2',
        title: 'Sangkuriang',
        region: 'Jawa Barat',
        category: 'Legenda',
        description: 'Legenda terbentuknya Gunung Tangkuban Perahu',
        audioUrl: 'assets/audio/sangkuriang.mp3',
        imageUrl: 'assets/images/sangkuriang.jpg',
        duration: Duration(minutes: 12, seconds: 15),
        wisdom: 'Kesabaran dan kebijaksanaan mengalahkan amarah',
        fullStory: '',
        characters: ['Sangkuriang', 'Dayang Sumbi'],
        setting: 'Gunung',
      ),
      Story(
        id: '3',
        title: 'Timun Mas',
        region: 'Jawa Tengah',
        category: 'Dongeng',
        description: 'Petualangan gadis kecil melawan raksasa',
        audioUrl: 'assets/audio/timun_mas.mp3',
        imageUrl: 'assets/images/timun_mas.jpg',
        duration: Duration(minutes: 10, seconds: 45),
        wisdom: 'Keberanian dan kecerdikan dapat mengalahkan kekuatan',
        fullStory: '',
        characters: ['Timun Mas', 'Raksasa'],
        setting: 'Hutan',
      ),
    ];
  }
}