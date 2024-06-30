import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/diagnosa_cubit.dart';
import 'package:mugi/cubit/gejala_cubit.dart';
import 'package:mugi/cubit/gejala_state.dart';
import 'package:mugi/models/data_gejala.dart';
import 'package:mugi/models/gejala.dart';

enum Jawaban { ya, tidak }

class DiagnosaScreen extends StatefulWidget {
  const DiagnosaScreen({super.key});

  @override
  State<DiagnosaScreen> createState() => _DiagnosaScreenState();
}

class _DiagnosaScreenState extends State<DiagnosaScreen> {
  List<Gejala> _daftarGejala = [];
  List<DataGejala> _gejalaPengguna = [];

  int _gejalaIndex = 0;
  bool _isStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: BlocBuilder<GejalaCubit, GejalaState>(
          builder: (context, state) {
            if (state is GejalaLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else if (state is GejalaSuccess) {
              _daftarGejala = state.gejala;

              for (var i in _daftarGejala) {
                _gejalaPengguna.add(DataGejala(id: i.id, jawaban: "Tidak"));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LinearProgressIndicator(
                    color: Colors.blue,
                    value: _isStarted ? _gejalaIndex / _daftarGejala.length : null,
                  ),
                  Expanded(child: Container()),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
                      child: _isStarted
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  _daftarGejala[_gejalaIndex].nama,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                RadioListTile(
                                  title: const Text('Ya'),
                                  value: "Ya",
                                  groupValue: _gejalaPengguna[_gejalaIndex].jawaban,
                                  onChanged: (value) {
                                    setState(() {
                                      _gejalaPengguna[_gejalaIndex] = DataGejala(
                                        id: _daftarGejala[_gejalaIndex].id,
                                        jawaban: "Ya",
                                      );
                                    });
                                  },
                                  visualDensity: VisualDensity.compact,
                                ),
                                RadioListTile(
                                  title: const Text('Tidak'),
                                  value: "Tidak",
                                  groupValue: _gejalaPengguna[_gejalaIndex].jawaban,
                                  onChanged: (value) {
                                    setState(() {
                                      _gejalaPengguna[_gejalaIndex] = DataGejala(
                                        id: _daftarGejala[_gejalaIndex].id,
                                        jawaban: "Tidak",
                                      );
                                    });
                                  },
                                  visualDensity: VisualDensity.compact,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FilledButton(
                                      onPressed: _gejalaIndex == 0
                                          ? null
                                          : () {
                                              setState(() {
                                                _gejalaIndex--;
                                              });
                                            },
                                      child: const Text("Sebelumnya"),
                                    ),
                                    if (_gejalaIndex < _daftarGejala.length - 1)
                                      FilledButton(
                                        onPressed: () {
                                          setState(() {
                                            _gejalaIndex++;
                                          });
                                        },
                                        child: const Text("Selanjutnya"),
                                      )
                                    else
                                      FilledButton(
                                        onPressed: () {
                                          context.read<DiagnosaCubit>().diagnosa(_gejalaPengguna);
                                        },
                                        child: const Text("Selesai"),
                                      ),
                                  ],
                                )
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Diagnosa",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                FilledButton(
                                  onPressed: () {
                                    setState(() {
                                      _isStarted = true;
                                    });
                                  },
                                  child: const Text("Mulai"),
                                ),
                              ],
                            ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              );
            } else {
              return const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Diagnosa",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
