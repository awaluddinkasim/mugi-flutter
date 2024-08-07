import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mugi/models/hasil.dart';
import 'package:mugi/models/hasil_diagnosa.dart';
import 'package:mugi/shared/widgets/saran_kesehatan.dart';

class RiwayatDetailScreen extends StatelessWidget {
  const RiwayatDetailScreen({super.key, required this.diagnosa});

  final HasilDiagnosa diagnosa;

  @override
  Widget build(BuildContext context) {
    List<Hasil> daftarHasil = diagnosa.hasil;

    String img = daftarHasil.isEmpty ? "healthy.svg" : "result.svg";

    var formatter = NumberFormat('#.##');

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: const Text(
                  "Tidak ada penyakit ditemukan",
                  textAlign: TextAlign.center,
                ),
              )
            else
              for (Hasil hasil in daftarHasil)
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        hasil.penyakit.nama,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Kecocokan Gejala: ${formatter.format(hasil.persentase)}%",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  trailing: FilledButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Nama Penyakit",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    hasil.penyakit.nama,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "Deskripsi",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    hasil.penyakit.deskripsi,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    "Cara Penanganan",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    hasil.penyakit.caraPenanganan,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                    ),
                    child: const Text("Detail"),
                  ),
                ),
            const SizedBox(
              height: 32,
            ),
            const SaranKesehatan(),
          ],
        ),
      ),
    );
  }
}
