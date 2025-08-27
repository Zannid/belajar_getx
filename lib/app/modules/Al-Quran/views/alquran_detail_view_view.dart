import 'package:flutter/material.dart';
import 'package:belajar_getx/app/data/models/alquran.dart';
import 'package:just_audio/just_audio.dart';

class AlquranDetailViewView extends StatefulWidget {
  final Alquran post;

  const AlquranDetailViewView({Key? key, required this.post}) : super(key: key);

  @override
  State<AlquranDetailViewView> createState() => _AlquranDetailViewViewState();
}

class _AlquranDetailViewViewState extends State<AlquranDetailViewView> {
  late AudioPlayer _player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    if (widget.post.audio != null && widget.post.audio!.isNotEmpty) {
      _player.setUrl(widget.post.audio!);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _toggleAudio() async {
    if (isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Text(post.nama ?? 'Detail Surat'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          shadowColor: Colors.green.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Asma dalam huruf arab
                Text(
                  post.asma ?? '',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: 'Amiri', // opsional, lebih mirip tulisan arab
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                // Nama Latin & Jenis Surat
                Text(
                  "${post.nama} (${post.type?.name.toUpperCase()})",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),

                // Tambahan Bismillah
                Text(
                  "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                    fontFamily: 'Amiri',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                Divider(color: Colors.green.shade200, thickness: 1.2),

                ListTile(
                  leading: const Icon(Icons.translate, color: Colors.green),
                  title: const Text("Arti"),
                  subtitle: Text(post.arti ?? '-'),
                ),
                Divider(color: Colors.green.shade200, thickness: 1.2),

                ListTile(
                  leading: const Icon(Icons.menu_book, color: Colors.green),
                  title: const Text("Jumlah Ayat"),
                  subtitle: Text("${post.ayat ?? 0} ayat"),
                ),
                Divider(color: Colors.green.shade200, thickness: 1.2),

                ListTile(
                  leading: const Icon(Icons.numbers, color: Colors.green),
                  title: const Text("Nomor Surat"),
                  subtitle: Text(post.nomor?.toString() ?? '-'),
                ),
                Divider(color: Colors.green.shade200, thickness: 1.2),

                ListTile(
                  leading: const Icon(Icons.info_outline, color: Colors.green),
                  title: const Text("Keterangan"),
                  subtitle: Text(post.keterangan ?? '-'),
                ),

                if (post.audio != null && post.audio!.isNotEmpty) ...[
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: _toggleAudio,
                      icon: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        size: 28,
                      ),
                      label: Text(
                        isPlaying ? "Pause Audio" : "Putar Audio",
                        style: const TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
