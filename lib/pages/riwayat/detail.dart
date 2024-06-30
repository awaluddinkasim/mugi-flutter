import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mugi/models/hasil.dart';
import 'package:mugi/models/hasil_diagnosa.dart';

class RiwayatDetailScreen extends StatelessWidget {
  const RiwayatDetailScreen({super.key, required this.diagnosa});

  final HasilDiagnosa diagnosa;

  @override
  Widget build(BuildContext context) {
    List<Hasil> daftarHasil = diagnosa.hasil;

    String img = daftarHasil.isEmpty ? "healthy.svg" : "result.svg";
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 48,
          ),
          SvgPicture.asset(
            "assets/$img",
            height: 300,
          ),
          const Text(
            "Hasil Diagnosa",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          if (daftarHasil.isEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: const Text(
                    "Tidak ada penyakit ditemukan",
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kembali"),
                  ),
                ),
              ],
            )
          else
            for (Hasil hasil in daftarHasil)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      hasil.penyakit.nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Persentase: ${hasil.persentase}%",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                trailing: FilledButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text("Detail"),
                ),
              )
        ],
      ),
    );
  }
}
