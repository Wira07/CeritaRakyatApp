import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _audioPlayer;

  // Constructor to allow dependency injection of the AudioPlayer for testing
  AudioService({AudioPlayer? audioPlayer}) : _audioPlayer = audioPlayer ?? AudioPlayer();

  // Play audio from a URL or asset
  Future<void> playAudio(String audioUrl) async {
    // Correct way to create audio source in audioplayers v6.x.x
    final audioSource = UrlSource(audioUrl); // Use UrlSource instead of AudioSource
    await _audioPlayer.play(audioSource);
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
