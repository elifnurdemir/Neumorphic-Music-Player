import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing Now'),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stack kullanarak butonları yerleştiriyoruz
            Stack(
              alignment: Alignment.center,
              children: [
                // Şarkı görseli dairesel olacak
                const CircleAvatar(
                  radius: 130,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  backgroundColor: Colors.green,
                ),
                // Row içinde butonları birbirine eşit mesafeye yerleştiriyoruz
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, size: 40),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.repeat, size: 40),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Şarkı ve Şarkıcı Adı
            const Text(
              'Şarkı Adı',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Şarkıcı Adı',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 40),

            // Müzik İlerleme Çubuğu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
                minHeight: 8, // Çubuk kalınlığı
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 40),

            // Müzik Kontrol Butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous, size: 40),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next, size: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
