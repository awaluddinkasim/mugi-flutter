import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/riwayat_cubit.dart';
import 'package:mugi/cubit/riwayat_state.dart';
import 'package:mugi/models/hasil_diagnosa.dart';
import 'package:mugi/pages/riwayat/detail.dart';
import 'package:mugi/shared/widgets/text_header.dart';

class RiwayatListScreen extends StatelessWidget {
  const RiwayatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          const TextHeader(
            title: "Riwayat Diagnosa",
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocBuilder<RiwayatCubit, RiwayatState>(
              builder: (context, state) {
                if (state is RiwayatLoading) {
                  return const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is RiwayatSuccess) {
                  List<HasilDiagnosa> daftarDiagnosa = state.hasilDiagnosa;

                  if (daftarDiagnosa.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text(
                        "Tidak ada riwayat",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54),
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        for (var diagnosa in daftarDiagnosa)
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RiwayatDetailScreen(
                                        diagnosa: diagnosa,
                                      ),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black38,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(diagnosa.tanggal),
                                            Text(
                                              "Pukul ${diagnosa.pukul}",
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.chevron_right),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    );
                  }
                } else {
                  return const Text("Error");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
