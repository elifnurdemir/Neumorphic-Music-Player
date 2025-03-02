import 'package:flutter/material.dart';

// Sabitler
// Dark background rengini belirliyoruz.
const Color _kDarkBgColor = Color.fromARGB(255, 27, 27, 27);

// Border rengi için sabit.
const Color _kBorderColor = Colors.transparent;

// Varsayılan ikon boyutu sabiti.
const double _kIconSize = 20.0;

// Varsayılan padding değeri.
const EdgeInsets _kPadding = EdgeInsets.all(20);

// Border genişliği sabiti.
const double _kBorderWidth = 0.5;

class NeumorphicButton extends StatefulWidget {
  final IconData icon; // İkon verisi.
  final VoidCallback onPressed; // Butona tıklandığında çalışacak fonksiyon.
  final double iconSize; // İkon boyutu.
  final Color bgColor; // Butonun arka plan rengi.
  final EdgeInsets padding; // Butonun iç padding'i.
  final Color borderColor; // Border rengi.
  final bool useFixedSize; // Sabit boyut kullanma durumu.

  const NeumorphicButton({
    super.key,
    required this.icon, // İkon verisi zorunlu.
    required this.onPressed, // Tıklama fonksiyonu zorunlu.
    this.iconSize = _kIconSize, // Varsayılan ikon boyutu.
    this.bgColor = _kDarkBgColor, // Varsayılan arka plan rengi.
    this.padding = _kPadding, // Varsayılan padding.
    this.borderColor = _kBorderColor, // Varsayılan border rengi.
    this.useFixedSize = false, // Varsayılan olarak sabit boyut kullanılmaz.
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false; // Butonun basılı olup olmadığını tutar.

  // Butonun gölge efektleri, basıldığında daha koyu, basılmadığında daha açık olur.
  List<BoxShadow> get _shadows => [
    BoxShadow(
      // Basıldığında daha koyu, basılmadığında daha açık gölge.
      color:
          _isPressed
              ? const Color.fromARGB(204, 57, 57, 57) // Basıldığında daha koyu
              : const Color.fromARGB(
                26,
                42,
                42,
                42,
              ), // Basılmadığında daha açık
      offset: Offset(
        _isPressed ? 3 : 6,
        _isPressed ? 3 : 6,
      ), // Basılınca gölge yeri değişir.
      blurRadius: _isPressed ? 3 : 6, // Basılınca daha az bulanık olur.
    ),
    BoxShadow(
      // İkinci gölge, ışık etkisini sağlar.
      color: const Color.fromARGB(26, 137, 137, 137),
      offset: Offset(
        _isPressed ? -3 : -6,
        _isPressed ? -3 : -6,
      ), // Gölge yeri, basıldığında ters yönde.
      blurRadius: _isPressed ? 3 : 6, // Basılmadığında daha büyük bulanıklık.
    ),
  ];

  // Butonun gradient (gradyan) arka plan rengi.
  Gradient get _gradient => LinearGradient(
    begin: Alignment.topLeft, // Başlangıç noktasını belirler.
    end: Alignment.bottomRight, // Bitiş noktasını belirler.
    colors:
        _isPressed
            ? [
              Colors.grey.shade900,
              Colors.grey.shade700,
            ] // Basıldığında daha koyu renkler.
            : [
              const Color.fromARGB(255, 97, 96, 96),
              const Color.fromARGB(255, 19, 19, 19),
            ], // Basılmadığında daha açık renkler.
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Ekran genişliği

    // İkon boyutunu sabit değeri ya da ekran genişliğine göre ayarlıyoruz.
    double iconSize = widget.iconSize;
    double paddingSize = widget.padding.top;

    // Eğer sabit boyut kullanılmazsa, ikon boyutunu ekran genişliğine göre ayarla.
    if (!widget.useFixedSize) {
      iconSize =
          screenWidth * 0.08; // Ekran genişliğinin %8'i kadar ikon boyutu.
      paddingSize =
          screenWidth * 0.04; // Ekran genişliğinin %4'ü kadar padding.
    }

    // Butona tıklama olaylarını tanımlıyoruz.
    return GestureDetector(
      onTapDown:
          (_) => setState(
            () => _isPressed = true,
          ), // Tıklandığında buton basılı gibi görünür.
      onTapUp: (_) {
        setState(
          () => _isPressed = false,
        ); // Tıklama bittiğinde buton normal hale gelir.
        widget.onPressed(); // Tıklama fonksiyonu çağrılır.
      },
      onTapCancel:
          () => setState(
            () => _isPressed = false,
          ), // Tıklama iptal olursa buton normale döner.
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 150,
        ), // Buton basıldığında geçiş süresi.
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Butonun yuvarlak olmasını sağlar.
          color: widget.bgColor, // Butonun arka plan rengini ayarlıyoruz.
          border: Border.all(
            color: widget.borderColor,
            width: _kBorderWidth,
          ), // Butonun kenarlık rengi.
          gradient: _gradient, // Butonun arka planındaki gradyan renkler.
          boxShadow: _shadows, // Butona eklediğimiz gölge efektleri.
        ),
        child: Padding(
          padding: EdgeInsets.all(
            paddingSize,
          ), // Butonun içindeki alanı belirler.
          child: Icon(
            widget.icon, // İkonun kendisi.
            size: iconSize, // İkon boyutu.
            color:
                _isPressed
                    ? const Color.fromARGB(
                      255,
                      171,
                      164,
                      164,
                    ) // Basıldığında daha açık renk.
                    : const Color.fromARGB(
                      255,
                      139,
                      139,
                      139,
                    ), // Basılmadığında daha koyu renk.
          ),
        ),
      ),
    );
  }
}
