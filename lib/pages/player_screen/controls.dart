import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/constants/neumorphic_button.dart';
import 'package:music_player/pages/player_screen/audio_progressbar.dart';

class MusicControls extends StatefulWidget {
  final Function(bool)? onPlayStateChanged;

  const MusicControls({super.key, this.onPlayStateChanged});

  @override
  MusicControlsState createState() => MusicControlsState();
}

class MusicControlsState extends State<MusicControls> {
  bool isPlaying = false;
  late AudioPlayer _audioPlayer;
  int _currentSongIndex = 0;

  // For tracking audio position
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  List<Map<String, String>> playlist = [
    {
      'title': 'Sarki Adi 1',
      'artist': 'Sarkici Adi 1',
      'url': 'sounds/spanish.mp3',
    },
    {
      'title': 'Sarki Adi 2',
      'artist': 'Sarkici Adi 2',
      'url': 'sounds/daftpunk.mp3',
    },
    {
      'title': 'Sarki Adi 3',
      'artist': 'Sarkici Adi 3',
      'url': 'sounds/metamorphosis.mp3',
    },
    {
      'title': 'Sarki Adi 4',
      'artist': 'Sarkici Adi 4',
      'url': 'sounds/spanish.mp3',
    },
    {
      'title': 'Sarki Adi 5',
      'artist': 'Sarkici Adi 5',
      'url': 'sounds/tomsdiner.mp3',
    },
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _setupAudioPlayerListeners();
  }

  // Set up audio player listeners
  void _setupAudioPlayerListeners() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() => _duration = newDuration);
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() => _position = newPosition);
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      _playNext();
      widget.onPlayStateChanged?.call(isPlaying);
    });
  }

  // Play the specified song
  Future<void> _playCurrentSong() async {
    try {
      await _audioPlayer.play(AssetSource(playlist[_currentSongIndex]['url']!));
      setState(() => isPlaying = true);
      widget.onPlayStateChanged?.call(true);
    } catch (e) {
      print("Error playing sound: $e");
      setState(() => isPlaying = false);
    }
  }

  // Toggle between play and pause states
  void togglePlayPause() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
        setState(() => isPlaying = false);
      } else {
        _playCurrentSong();
      }
      widget.onPlayStateChanged?.call(isPlaying);
    } catch (e) {
      print("Error toggling play/pause: $e");
    }
  }

  // Play the next song in the playlist
  void _playNext() {
    setState(() {
      _currentSongIndex = (_currentSongIndex + 1) % playlist.length;
    });
    _playCurrentSong();
  }

  // Play the previous song in the playlist
  void _playPrevious() {
    setState(() {
      _currentSongIndex =
          (_currentSongIndex - 1 + playlist.length) % playlist.length;
    });
    _playCurrentSong();
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Free up the AudioPlayer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Always display the progress bar
        AudioProgressBar(
          position: _position,
          duration: _duration,
          onSeek: (duration) async => await _audioPlayer.seek(duration),
          onChanged:
              (value) async =>
                  await _audioPlayer.seek(Duration(seconds: value.toInt())),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Previous track button
            _buildControlButton(Icons.skip_previous, _playPrevious),
            const SizedBox(width: 20),
            // Play/Pause button (Main button)
            _buildControlButton(
              isPlaying ? Icons.pause : Icons.play_arrow,
              togglePlayPause,
              iconSize: 50,
              padding: 20,
            ),
            const SizedBox(width: 20),
            // Next track button
            _buildControlButton(Icons.skip_next, _playNext),
          ],
        ),
      ],
    );
  }

  // Helper method to build a control button
  Widget _buildControlButton(
    IconData icon,
    VoidCallback onPressed, {
    double iconSize = 35,
    double padding = 16,
  }) {
    return NeumorphicButton(
      icon: icon,
      iconSize: iconSize,
      bgColor: const Color(0xFF2E2E2E),
      padding: EdgeInsets.all(padding),
      onPressed: onPressed,
    );
  }
}
