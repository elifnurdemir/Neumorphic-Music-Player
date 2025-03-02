import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data/song_data.dart';
import 'package:music_player/pages/player_screen/song.dart';

class MusicState {
  final bool isPlaying;
  final Duration duration;
  final Duration position;

  MusicState({
    required this.isPlaying,
    required this.duration,
    required this.position,
  });

  MusicState copyWith({
    bool? isPlaying,
    Duration? duration,
    Duration? position,
  }) {
    return MusicState(
      isPlaying: isPlaying ?? this.isPlaying,
      duration: duration ?? this.duration,
      position: position ?? this.position,
    );
  }
}

class MusicControlsController {
  final Function(bool)? onPlayStateChanged;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Song> _playlist = PlaylistData.songs;
  int _currentSongIndex = 0;

  final StreamController<MusicState> _stateController =
      StreamController<MusicState>.broadcast();

  MusicState _currentState = MusicState(
    isPlaying: false,
    duration: Duration.zero,
    position: Duration.zero,
  );

  MusicState get currentState => _currentState;

  Stream<MusicState> get musicStateStream => _stateController.stream;

  MusicControlsController({this.onPlayStateChanged}) {
    _setupListeners();
  }

  void _setupListeners() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _updateState(duration: newDuration);
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _updateState(position: newPosition);
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      playNext();
    });
  }

  Future<void> _playCurrentSong() async {
    try {
      await _audioPlayer.play(
        AssetSource(_playlist[_currentSongIndex].filePath),
      );
      _updateState(isPlaying: true);
    } catch (e) {
      debugPrint('Error playing audio: $e');
      _updateState(isPlaying: false);
    }
  }

  void togglePlayPause() async {
    if (_currentState.isPlaying) {
      await _audioPlayer.pause();
      _updateState(isPlaying: false);
    } else {
      _playCurrentSong();
    }
  }

  void playNext() {
    _currentSongIndex = (_currentSongIndex + 1) % _playlist.length;
    _playCurrentSong();
  }

  void playPrevious() {
    _currentSongIndex =
        (_currentSongIndex - 1 + _playlist.length) % _playlist.length;
    _playCurrentSong();
  }

  Future<void> seek(Duration duration) async {
    await _audioPlayer.seek(duration);
  }

  void _updateState({bool? isPlaying, Duration? duration, Duration? position}) {
    _currentState = _currentState.copyWith(
      isPlaying: isPlaying,
      duration: duration,
      position: position,
    );
    _stateController.add(_currentState);
    onPlayStateChanged?.call(_currentState.isPlaying);
  }

  void dispose() {
    _audioPlayer.dispose();
    _stateController.close();
  }
}
