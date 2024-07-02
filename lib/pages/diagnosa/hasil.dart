import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mugi/cubit/diagnosa_cubit.dart';
import 'package:mugi/cubit/diagnosa_state.dart';
import 'package:mugi/models/hasil.dart';
import 'package:mugi/shared/widgets/saran_kesehatan.dart';

class HasilDiagnosaScreen extends StatefulWidget {
  const HasilDiagnosaScreen({super.key});

  @override
  State<HasilDiagnosaScreen> createState() => _HasilDiagnosaScreenState();
}

class _HasilDiagnosaScreenState extends State<HasilDiagnosaScreen> {
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#.##');

    return Scaffold(
      body: BlocBuilder<DiagnosaCubit, DiagnosaState>(
        builder: (context, state) {
          if (state is DiagnosaLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DiagnosaSuccess) {
            List<Hasil> daftarHasil = state.data.hasil;

            String img = daftarHasil.isEmpty ? "healthy.svg" : "result.svg";

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
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
            );
          } else {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Terjadi kesalahan"),
              ],
            );
          }
        },
      ),
    );
  }
}
