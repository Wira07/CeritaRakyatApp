import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Play audio from a URL or asset
  Future<void> playAudio(String audioUrl) async {
    // Use the correct AudioSource class: `AudioSource.uri()` for a URL
    await _audioPlayer.play(UrlSource(audioUrl));  // Use UrlSource for URLs
  }

  // Pause the audio
  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
  }

  // Stop the audio
  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }

  // Seek audio position
  Future<void> seekAudio(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Get the duration of the audio
  Future<Duration?> getAudioDuration() async {
    return await _audioPlayer.getDuration();
  }

  // Get the current position of the audio
  Future<Duration?> getCurrentPosition() async {
    return await _audioPlayer.getCurrentPosition();
  }
}
