// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/constants/neumorphic_button.dart';
import 'package:music_player/constants/title_textstyle.dart';
import 'package:music_player/data/song_data.dart';
import 'package:music_player/pages/player_screen/song.dart';

// Global player and currently playing track
final AudioPlayer globalAudioPlayer = AudioPlayer();
String? currentlyPlaying;
// Simple in-memory favorite songs list
final Set<String> favoriteSongs = {};

class Playlist {
  static final List<Song> songs = PlaylistData.songs;

  static List<Widget> getItems() {
    return List.generate(songs.length, (index) {
      return SongTile(key: ValueKey(songs[index].title), song: songs[index]);
    });
  }
}

class SongTile extends StatefulWidget {
  final Song song;

  const SongTile({super.key, required this.song});

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  bool isFavorited = false;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Check if this song is already in favorites
    isFavorited = favoriteSongs.contains(widget.song.title);

    // Listen for player state changes
    globalAudioPlayer.onPlayerStateChanged.listen((playerState) {
      if (mounted) {
        if (currentlyPlaying == widget.song.filePath) {
          setState(() {
            isPlaying = playerState == PlayerState.playing;
          });
        } else {
          setState(() {
            isPlaying = false;
          });
        }
      }
    });

    // Listen for song completion
    globalAudioPlayer.onPlayerComplete.listen((_) {
      if (mounted && currentlyPlaying == widget.song.filePath) {
        setState(() {
          isPlaying = false;
          currentlyPlaying = null;
        });
      }
    });
  }

  Future<void> _togglePlayPause() async {
    try {
      if (isPlaying) {
        // If already playing, pause it
        await globalAudioPlayer.pause();
      } else {
        // If another song is playing, stop it first
        if (currentlyPlaying != null &&
            currentlyPlaying != widget.song.filePath) {
          await globalAudioPlayer.stop();
        }

        // Play this song
        await globalAudioPlayer.play(AssetSource(widget.song.filePath));
        currentlyPlaying = widget.song.filePath;
        setState(() {
          isPlaying = true;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Hata: Müzik oynatılamadı! $e')));
      }
    }
  }

  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;

      // Update the global favorites set
      if (isFavorited) {
        favoriteSongs.add(widget.song.title);
      } else {
        favoriteSongs.remove(widget.song.title);
      }
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isFavorited ? 'Favorilere Eklendi' : 'Favorilerden Çıkarıldı',
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.song.title,
        style: TitleTextStyle.title.copyWith(
          color: isPlaying ? Colors.cyan : Colors.black, // Turkuaz rengi
        ),
      ),
      subtitle: Text(
        widget.song.artist,
        style: const TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: Colors.grey,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          NeumorphicButton(
            icon: isPlaying ? Icons.pause : Icons.play_arrow,
            onPressed: _togglePlayPause,
            bgColor: isPlaying ? Colors.cyan : Colors.black, // Turkuaz rengi
          ),
          const SizedBox(width: 10),
          NeumorphicButton(
            icon: isFavorited ? Icons.favorite : Icons.favorite_border,
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}
