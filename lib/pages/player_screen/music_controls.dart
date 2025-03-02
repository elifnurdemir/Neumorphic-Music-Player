import 'package:flutter/material.dart';
import 'package:music_player/controllers/music_controls_controller.dart';
import 'package:music_player/pages/player_screen/audio_progressbar.dart';
import 'package:music_player/constants/neumorphic_button.dart';

class MusicControls extends StatefulWidget {
  final Function(bool)? onPlayStateChanged;

  const MusicControls({super.key, this.onPlayStateChanged});

  @override
  MusicControlsState createState() => MusicControlsState();
}

class MusicControlsState extends State<MusicControls> {
  late MusicControlsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MusicControlsController(
      onPlayStateChanged: widget.onPlayStateChanged,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MusicState>(
      stream: _controller.musicStateStream,
      initialData: _controller.currentState,
      builder: (context, snapshot) {
        final state = snapshot.data!;

        return Column(
          children: [
            AudioProgressBar(
              position: state.position,
              duration: state.duration,
              onSeek: _controller.seek,
              onChanged: (value) async {
                await _controller.seek(Duration(seconds: value.toInt()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildControlButton(
                  Icons.skip_previous,
                  _controller.playPrevious,
                ),
                const SizedBox(width: 20),
                _buildControlButton(
                  state.isPlaying ? Icons.pause : Icons.play_arrow,
                  _controller.togglePlayPause,
                  iconSize: 50,
                  padding: 20,
                ),
                const SizedBox(width: 20),
                _buildControlButton(Icons.skip_next, _controller.playNext),
              ],
            ),
          ],
        );
      },
    );
  }

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
