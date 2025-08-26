import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenView extends StatelessWidget {
  const ResultScreenView({
    super.key,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
  });

  final String name;
  final String gender;
  final DateTime dateOfBirth;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Pendaftaran'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: $name"),
            const SizedBox(height: 8),
            Text("Jenis Kelamin: $gender"),
            const SizedBox(height: 8),
            Text(
                "Tanggal Lahir: ${DateFormat('dd-MM-yyyy').format(dateOfBirth)}"),
            const SizedBox(height: 8),
            Text("No. HP: $phone"),
          ],
        ),
      ),
    );
  }
}
