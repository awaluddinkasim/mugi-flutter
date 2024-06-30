import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/diagnosa_cubit.dart';
import 'package:mugi/cubit/diagnosa_state.dart';
import 'package:mugi/models/hasil.dart';

class HasilDiagnosaScreen extends StatefulWidget {
  const HasilDiagnosaScreen({super.key});

  @override
  State<HasilDiagnosaScreen> createState() => _HasilDiagnosaScreenState();
}

class _HasilDiagnosaScreenState extends State<HasilDiagnosaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DiagnosaCubit, DiagnosaState>(
        builder: (context, state) {
          if (state is DiagnosaLoading) {
            return const CircularProgressIndicator();
          } else if (state is DiagnosaSuccess) {
            List<Hasil> daftarHasil = state.data.hasil;
            return ListView(
              children: [
                for (Hasil hasil in daftarHasil)
                  ListTile(
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
