import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicProgressBar extends StatefulWidget {
  const MusicProgressBar({super.key});

  @override
  _MusicProgressBarState createState() => _MusicProgressBarState();
}

class _MusicProgressBarState extends State<MusicProgressBar> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _progress = 0.0;
  double _totalDuration = 1.0; // Şarkının toplam süresi (başlangıçta 1)

  @override
  void initState() {
    super.initState();

    // Toplam şarkı süresi değiştiğinde güncelleme
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration.inSeconds.toDouble();
      });
    });

    // Şarkı oynatıldıkça progress bar'ı güncelleme
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _progress = position.inSeconds.toDouble() / _totalDuration;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: LinearProgressIndicator(
        value: _progress,
        backgroundColor: Colors.grey[300],
        valueColor: const AlwaysStoppedAnimation(Color(0xFF26A69A)),
        minHeight: 8,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
