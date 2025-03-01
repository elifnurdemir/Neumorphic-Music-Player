// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/constants/neumorphic_button.dart';
import 'package:music_player/constants/title_textstyle.dart';

class Playlist {
  static List<Map<String, String>> songs = [
    {
      'title': 'Sarki Adi 1',
      'artist': 'Sarkici Adi 1',
      'url': 'assets/sounds/spanish.mp3',
    },
    {
      'title': 'Sarki Adi 2',
      'artist': 'Sarkici Adi 2',
      'url': 'assets/sounds/daftpunk.mp3',
    },
    {
      'title': 'Sarki Adi 3',
      'artist': 'Sarkici Adi 3',
      'url': 'assets/sounds/metamorphosis.mp3',
    },

    {
      'title': 'Sarki Adi 5',
      'artist': 'Sarkici Adi 5',
      'url': 'assets/sounds/tomsdiner.mp3',
    },
  ];

  static int? length;

  static List<Widget> getItems() {
    return List.generate(songs.length, (index) {
      return SongTile(
        songTitle: songs[index]['title'] ?? '',
        artistName: songs[index]['artist'] ?? '',
        audioAssetPath: songs[index]['url'] ?? '',
      );
    });
  }
}

class SongTile extends StatefulWidget {
  final String songTitle;
  final String artistName;
  final String audioAssetPath;

  const SongTile({
    super.key,
    required this.songTitle,
    required this.artistName,
    required this.audioAssetPath,
  });

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  bool isPlaying = false; // Müzik çalıyor mu?
  bool isFavorited = false; // Şarkı favoriye eklendi mi?
  final AudioPlayer _audioPlayer = AudioPlayer(); // AudioPlayer nesnesi

  @override
  void initState() {
    super.initState();
    // Müzik çalma durumu dinleniyor ve isPlaying değişkeni güncelleniyor
    _audioPlayer.onPlayerStateChanged.listen((playerState) {
      setState(() {
        isPlaying = playerState == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // AudioPlayer'ı serbest bırakıyoruz
    super.dispose();
  }

  // Müzik çalmasını başlatma veya duraklatma
  Future<void> _togglePlayPause() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause(); // Eğer müzik çalıyorsa duraklat
      } else {
        await _audioPlayer.play(
          AssetSource(widget.audioAssetPath),
        ); // Eğer müzik duraklatıldıysa, çalmaya başla
      }

      setState(() {
        isPlaying = !isPlaying; // Çalma durumu tersine çevriliyor
      });
    } catch (e) {
      // Hata yakalama
      debugPrint("Hata: Müzik oynatılamadı! $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Hata: Müzik oynatılamadı!')));
    }
  }

  // Favori ekleme veya çıkarma işlemi
  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });

    // Favori durumu değiştiğinde kullanıcıya bildirim gönder
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorited ? 'Favorilere Eklendi' : 'Favorilerden Çıkarıldı',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.songTitle, // Şarkı adı
        style: TitleTextStyle.title,
      ),
      subtitle: Text(
        widget.artistName, // Sanatçı adı
        style: TextStyle(
          fontSize: 16, // Sanatçı adı font boyutu
          fontStyle: FontStyle.italic, // Sanatçı adı italik
          color: Colors.grey, // Sanatçı adı rengi
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 10),
          // Play/Pause butonu
          NeumorphicButton(
            icon:
                isPlaying
                    ? Icons.pause
                    : Icons
                        .play_arrow, // Eğer müzik çalıyorsa pause, değilse play ikonu göster
            onPressed: _togglePlayPause,
          ),
          // Favori butonu
          NeumorphicButton(
            icon:
                isFavorited
                    ? Icons.favorite
                    : Icons
                        .favorite_border, // Favoriye eklenmişse, dolu kalp simgesi
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}
