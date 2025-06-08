import '../models/story_model.dart';
import '../utils/constants.dart';

class StoriesData {
  static List<Story> get sampleStories => [
    Story(
      id: '1',
      title: 'Malin Kundang',
      region: 'Sumatera Barat',
      category: 'Legenda',
      description: 'Kisah tentang anak durhaka yang dikutuk menjadi batu karena tidak menghormati ibunya',
      fullStory: '''
Dahulu kala, di sebuah desa pesisir Sumatera Barat, hiduplah seorang janda miskin bernama Mande Rubaiah bersama anaknya yang bernama Malin Kundang. Mereka hidup dalam kemiskinan setelah ayah Malin meninggal dunia saat melaut.

Malin adalah anak yang cerdas dan tampan, namun ia merasa malu dengan kemiskinan keluarganya. Suatu hari, ia memutuskan untuk merantau ke negeri jauh untuk mengubah nasibnya. Dengan berat hati, ibunya melepas kepergian Malin dengan harapan anaknya akan kembali sebagai orang yang sukses.

Setelah bertahun-tahun merantau, Malin berhasil menjadi pedagang yang kaya raya. Ia menikah dengan putri seorang saudagar dan hidup mewah. Suatu hari, kapal dagang Malin singgah di kampung halamannya.

Mande Rubaiah yang sudah tua dan renta mendengar kabar kedatangan anaknya. Dengan langkah tertatih, ia mendatangi kapal untuk menemui Malin. Namun, Malin yang melihat ibunya yang sudah tua dan berpakaian compang-camping merasa malu. Ia menyangkal bahwa wanita tua itu adalah ibunya.

Hati Mande Rubaiah hancur mendengar sangkalan anaknya. Dengan air mata, ia berdoa kepada Tuhan agar anaknya diberi pelajaran. Tidak lama kemudian, badai besar melanda. Kapal Malin karam dan tubuhnya berubah menjadi batu yang masih dapat dilihat hingga kini di pantai Air Manis, Padang.
      ''',
      audioUrl: 'assets/audio/stories/malin_kundang.mp3',
      imageUrl: 'assets/images/stories/malin_kundang.jpg',
      duration: Duration(minutes: 8, seconds: 30),
      wisdom: 'Berbakti kepada orang tua adalah kewajiban yang mulia. Kesuksesan tidak akan berarti jika kita melupakan jasa orang tua.',
      characters: ['Malin Kundang', 'Mande Rubaiah', 'Istri Malin'],
      setting: 'Pantai Air Manis, Padang, Sumatera Barat',
    ),
    Story(
      id: '2',
      title: 'Sangkuriang',
      region: 'Jawa Barat',
      category: 'Legenda',
      description: 'Legenda terbentuknya Gunung Tangkuban Perahu dan Danau Bandung',
      fullStory: '''
Pada zaman dahulu, hiduplah seorang putri cantik bernama Dayang Sumbi di Jawa Barat. Ia memiliki seorang anak laki-laki bernama Sangkuriang hasil dari hubungannya dengan dewa yang menyamar sebagai anjing bernama Tumang.

Sangkuriang tumbuh menjadi pemuda yang tampan dan perkasa. Suatu hari, ia pergi berburu bersama Tumang. Namun, ia tidak tahu bahwa Tumang adalah ayahnya. Dalam perburuan tersebut, Sangkuriang membunuh Tumang karena merasa kesal anjing itu tidak berhasil menangkap buruan.

Ketika pulang, Sangkuriang memberikan daging hasil buruannya kepada ibunya. Dayang Sumbi terkejut mengetahui bahwa daging tersebut adalah daging Tumang. Dalam kemarahannya, ia memukul kepala Sangkuriang dengan sendok nasi hingga luka. Sangkuriang pun pergi merantau dengan perasaan sakit hati.

Setelah bertahun-tahun, Sangkuriang kembali ke kampung halamannya. Berkat kesaktiannya, ia awet muda sementara ibunya tetap cantik karena kesaktian yang dimilikinya. Mereka tidak saling mengenali. Sangkuriang jatuh cinta pada Dayang Sumbi dan melamarnya.

Dayang Sumbi mengenali Sangkuriang dari bekas luka di kepalanya. Ia tidak bisa menikah dengan anaknya sendiri, maka ia memberikan syarat yang mustahil: Sangkuriang harus membuat danau dan perahu dalam waktu satu malam.

Dengan kesaktiannya, Sangkuriang hampir berhasil menyelesaikan tugasnya. Dayang Sumbi panik dan meminta para bidadari untuk memerahkan langit timur sehingga Sangkuriang mengira fajar telah tiba. Dalam kemarahannya, Sangkuriang menendang perahu yang sedang dibuatnya. Perahu itu terbalik dan menjadi Gunung Tangkuban Perahu, sementara danau yang dibuat menjadi Danau Bandung.
      ''',
      audioUrl: 'assets/audio/stories/sangkuriang.mp3',
      imageUrl: 'assets/images/stories/sangkuriang.jpg',
      duration: Duration(minutes: 12, seconds: 15),
      wisdom: 'Kesabaran dan kebijaksanaan dapat mengalahkan amarah. Cinta yang sejati tidak mengenal pamrih dan pengorbanan.',
      characters: ['Sangkuriang', 'Dayang Sumbi', 'Tumang'],
      setting: 'Bandung, Jawa Barat',
    ),
    Story(
      id: '3',
      title: 'Timun Mas',
      region: 'Jawa Tengah',
      category: 'Dongeng',
      description: 'Petualangan seorang gadis kecil yang harus menghadapi raksasa pemakan manusia',
      fullStory: '''
Di sebuah desa di Jawa Tengah, hiduplah sepasang suami istri yang sudah lama mendambakan anak. Mereka sangat sedih karena belum juga dikaruniai keturunan. Suatu hari, seorang raksasa hijau datang dan menawarkan bantuan.

"Aku akan memberikan kalian biji mentimun ajaib," kata raksasa itu. "Tanamlah biji ini, dan kalian akan mendapat anak yang kalian inginkan. Tapi ingat, setelah anak itu berusia enam tahun, kalian harus menyerahkannya kepadaku."

Pasangan itu menyetujui perjanjian tersebut karena sangat menginginkan anak. Mereka menanam biji mentimun ajaib itu. Tidak lama kemudian, tumbuh pohon mentimun yang berbuah sangat besar. Ketika buah itu matang dan dipecah, keluarlah seorang bayi perempuan yang cantik. Mereka menamainya Timun Mas.

Timun Mas tumbuh menjadi anak yang cantik dan baik hati. Ketika ia berusia enam tahun, raksasa datang untuk menagih janji. Ayah dan ibu Timun Mas sangat sedih, namun mereka sudah terlanjur berjanji.

Sebelum pergi, seorang pertapa memberikan empat bungkusan kepada Timun Mas: biji mentimun, jarum, garam, dan terasi. "Gunakan ini jika kau dalam bahaya," pesan pertapa itu.

Timun Mas berlari sekuat tenaga dikejar raksasa. Ketika raksasa hampir menangkapnya, ia melempar biji mentimun. Seketika tumbuhlah hutan mentimun yang lebat. Raksasa kewalahan melewatinya, namun akhirnya berhasil juga.

Timun Mas kemudian melempar jarum. Jarum-jarum itu berubah menjadi hutan bambu yang tajam. Raksasa terluka tetapi tetap mengejar. Timun Mas melempar garam, dan terciptalah lautan garam yang luas. Raksasa berenang melewatinya dengan susah payah.

Akhirnya, Timun Mas melempar terasi. Terasi itu berubah menjadi lautan lumpur yang mendidih. Raksasa terjebak dan tenggelam dalam lumpur panas tersebut. Timun Mas selamat dan kembali ke rumah dengan selamat, berkumpul kembali dengan orang tuanya.
      ''',
      audioUrl: 'assets/audio/stories/timun_mas.mp3',
      imageUrl: 'assets/images/stories/timun_mas.jpg',
      duration: Duration(minutes: 10, seconds: 45),
      wisdom: 'Keberanian dan kecerdikan dapat mengalahkan kekuatan yang lebih besar. Pertolongan datang kepada mereka yang berusaha.',
      characters: ['Timun Mas', 'Ayah Timun Mas', 'Ibu Timun Mas', 'Raksasa Hijau', 'Pertapa'],
      setting: 'Desa di Jawa Tengah',
    ),
  ];
}
