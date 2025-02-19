import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        title: const Text(
          'Playing Now',
          style: TextStyle(color: Color(0xFFBDBDBD)),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info, color: Color(0xFFBDBDBD)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Color(0xFFBDBDBD)),
          ),
        ],
      ),
      backgroundColor: Color(0xFF212121),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // Stack kullanarak butonları yerleştiriyoruz
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Daire şekli
                    border: Border.all(
                      color: Colors.black54, // Çerçeve rengi
                      width: 5, // Çerçeve kalınlığı
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Gölge rengi
                        spreadRadius: 2, // Gölgenin yayılma mesafesi
                        blurRadius: 7, // Gölgenin bulanıklık derecesi
                        offset: Offset(0, 1), // Gölgenin yönü
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 130,
                    backgroundImage: AssetImage('assets/images/powerwolf.jpg'),
                    backgroundColor: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 40,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.repeat,
                        size: 40,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60),
            // Şarkı ve Şarkıcı Adı
            const Text(
              'Şarkı Adı',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBDBDBD),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Şarkıcı Adı',
              style: TextStyle(fontSize: 18, color: Color(0xFFBDBDBD)),
            ),
            const SizedBox(height: 60),

            // Müzik İlerleme Çubuğu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation(Color(0xFF26A69A)),
                minHeight: 8, // Çubuk kalınlığı
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 80),

            // Müzik Kontrol Butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    border: Border.all(color: Color(0xFFBDBDBD), width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 40,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF26A69A),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    border: Border.all(color: Color(0xFFBDBDBD), width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_next,
                      size: 40,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
