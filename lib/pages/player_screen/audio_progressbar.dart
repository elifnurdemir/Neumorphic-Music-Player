import 'package:flutter/material.dart';

class AudioProgressBar extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<double> onChanged;
  final Function(Duration) onSeek;

  const AudioProgressBar({
    super.key,
    required this.position,
    required this.duration,
    required this.onChanged,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure the position value is always accurate
    double progress = position.inSeconds.toDouble();
    double maxProgress =
        duration.inSeconds.toDouble() == 0
            ? 1.0
            : duration.inSeconds.toDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: [
          // The progress bar (Slider) will always be visible and aligned
          Slider(
            value: progress,
            max: maxProgress,
            min: 0.0,
            activeColor: const Color(0xFF26A69A),
            inactiveColor: Colors.grey.shade300,
            onChanged: (value) async {
              onChanged(
                value,
              ); // update the position when the slider is changed
              onSeek(
                Duration(seconds: value.toInt()),
              ); // seek the audio to the new position
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Format the time for the current position
                Text(
                  _formatDuration(position),
                  style: const TextStyle(color: Colors.white70),
                ),
                // Format the time for the total duration
                Text(
                  _formatDuration(duration),
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to format the time to a readable "MM:SS" format
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
