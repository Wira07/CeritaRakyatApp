// lib/data/quiz_data.dart
import '../models/quiz_model.dart';

class QuizData {
  static List<QuizQuestion> getQuestionsByStoryId(String storyId) {
    switch (storyId) {
      case '1': // Malin Kundang
        return [
          QuizQuestion(
            id: 'q1_1',
            storyId: '1',
            question: 'Apa pesan moral utama dari cerita Malin Kundang?',
            options: [
              'Pentingnya berbakti kepada orang tua',
              'Kekayaan adalah segalanya',
              'Kesombongan membawa kebahagiaan',
              'Melupakan asal usul tidak masalah'
            ],
            correctAnswer: 0,
            explanation: 'Cerita Malin Kundang mengajarkan pentingnya berbakti kepada orang tua dan tidak melupakan jasa mereka.',
          ),
          QuizQuestion(
            id: 'q1_2',
            storyId: '1',
            question: 'Dari daerah mana cerita Malin Kundang berasal?',
            options: [
              'Jawa Barat',
              'Sumatera Barat',
              'Kalimantan',
              'Sulawesi'
            ],
            correctAnswer: 1,
            explanation: 'Cerita Malin Kundang berasal dari Sumatera Barat, tepatnya dari daerah Padang.',
          ),
          QuizQuestion(
            id: 'q1_3',
            storyId: '1',
            question: 'Mengapa Malin Kundang menyangkal ibunya?',
            options: [
              'Karena ia tidak mengenali ibunya',
              'Karena ia malu dengan penampilan ibunya yang miskin',
              'Karena ibunya telah mengusirnya',
              'Karena ia ingin melindungi ibunya'
            ],
            correctAnswer: 1,
            explanation: 'Malin menyangkal ibunya karena malu dengan penampilan ibunya yang sudah tua dan berpakaian compang-camping.',
          ),
        ];
      case '2': // Sangkuriang
        return [
          QuizQuestion(
            id: 'q2_1',
            storyId: '2',
            question: 'Siapa nama ibu Sangkuriang?',
            options: [
              'Dayang Sumbi',
              'Roro Jonggrang',
              'Putri Mandalika',
              'Dewi Sri'
            ],
            correctAnswer: 0,
            explanation: 'Ibu Sangkuriang bernama Dayang Sumbi, seorang putri yang cantik dan memiliki kesaktian.',
          ),
          QuizQuestion(
            id: 'q2_2',
            storyId: '2',
            question: 'Apa yang terjadi dengan perahu yang dibuat Sangkuriang?',
            options: [
              'Tenggelam di laut',
              'Terbakar habis',
              'Ditendang dan menjadi Gunung Tangkuban Perahu',
              'Terbang ke langit'
            ],
            correctAnswer: 2,
            explanation: 'Dalam amarahnya, Sangkuriang menendang perahu yang sedang dibuatnya hingga terbalik dan menjadi Gunung Tangkuban Perahu.',
          ),
        ];
      case '3': // Timun Mas
        return [
          QuizQuestion(
            id: 'q3_1',
            storyId: '3',
            question: 'Berapa usia Timun Mas ketika raksasa datang menagih janji?',
            options: [
              '5 tahun',
              '6 tahun',
              '7 tahun',
              '8 tahun'
            ],
            correctAnswer: 1,
            explanation: 'Timun Mas berusia 6 tahun ketika raksasa datang untuk menagih janji.',
          ),
          QuizQuestion(
            id: 'q3_2',
            storyId: '3',
            question: 'Benda apa yang terakhir dilempar Timun Mas untuk mengalahkan raksasa?',
            options: [
              'Biji mentimun',
              'Jarum',
              'Garam',
              'Terasi'
            ],
            correctAnswer: 3,
            explanation: 'Terasi adalah benda terakhir yang dilempar Timun Mas, yang berubah menjadi lautan lumpur mendidih.',
          ),
        ];
      default:
        return [];
    }
  }
}