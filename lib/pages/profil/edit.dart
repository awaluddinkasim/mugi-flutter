import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/auth_cubit.dart';
import 'package:mugi/cubit/auth_state.dart';
import 'package:mugi/models/data_user.dart';
import 'package:mugi/shared/widgets/input.dart';
import 'package:mugi/shared/widgets/select.dart';
import 'package:mugi/shared/widgets/text_header.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final nama = TextEditingController();
  final noHP = TextEditingController();

  String? jenisKelamin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          const TextHeader(
            title: "Edit Profile",
          ),
          const SizedBox(
            height: 18,
          ),
          Form(
            key: _formKey,
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (state is AuthSuccess) {
                    email.text = state.auth.user.email;
                    nama.text = state.auth.user.nama;
                    noHP.text = state.auth.user.noHp;
                    jenisKelamin = state.auth.user.jk;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Input(
                          label: "Nama",
                          icon: const Icon(Icons.badge),
                          hintText: "Masukkan Nama",
                          controller: nama,
                          keyboardType: TextInputType.name,
                        ),
                        Input(
                          label: "Email",
                          icon: const Icon(Icons.email),
                          hintText: "Masukkan Email",
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Input(
                          label: "Ganti Password",
                          icon: const Icon(Icons.lock),
                          hintText: "Masukkan Password Baru",
                          controller: password,
                          helperText: const Text(
                            "Kosongkan jika tidak ingin mengganti password",
                            style: TextStyle(
                              color: Colors.black54,
                              fontStyle: FontStyle.italic,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Select(
                          value: jenisKelamin!,
                          label: "Jenis Kelamin",
                          hintText: "Pilih Jenis Kelamin",
                          icon: const Icon(Icons.transgender),
                          items: const [
                            DropdownMenuItem(
                              value: "Laki-laki",
                              child: Text("Laki-laki"),
                            ),
                            DropdownMenuItem(
                              value: "Perempuan",
                              child: Text("Perempuan"),
                            ),
                          ],
                          onChanged: (value) {
                            jenisKelamin = value;
                          },
                        ),
                        Input(
                          label: "No. HP",
                          icon: const Icon(Icons.smartphone),
                          hintText: "Masukkan No. HP",
                          controller: noHP,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FilledButton(
                          onPressed: () {
                            context.read<AuthCubit>().updateUser(
                                  DataUser(
                                    nama: nama.text,
                                    email: email.text,
                                    password: password.text,
                                    jk: jenisKelamin!,
                                    noHp: noHP.text,
                                  ),
                                );
                          },
                          child: const Text("Simpan"),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
