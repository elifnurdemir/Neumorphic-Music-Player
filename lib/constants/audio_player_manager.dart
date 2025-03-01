import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerManager with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentSongPath = '';

  AudioPlayer get player => _audioPlayer;

  // Müzik çalmayı başlatma veya duraklatma
  Future<void> togglePlayPause(String audioPath) async {
    if (currentSongPath != audioPath) {
      await _audioPlayer.play(AssetSource(audioPath));
      currentSongPath = audioPath;
      isPlaying = true;
    } else {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
      isPlaying = !isPlaying;
    }

    notifyListeners(); // Durum değiştiğinde tüm widget'ları günceller
  }

  void stop() {
    _audioPlayer.stop();
    currentSongPath = '';
    isPlaying = false;
    notifyListeners(); // Durumu sıfırlıyoruz
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
