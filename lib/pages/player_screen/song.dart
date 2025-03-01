class Song {
  final String title;
  final String artist;
  final String filePath;
  final String
  albumArtUrl; // Eğer şarkılara görsel eklemek istersen, yoksa boş geçilebilir.

  Song({
    required this.title,
    required this.artist,
    required this.filePath,
    this.albumArtUrl = '', // Boş kalabilir
  });
}
