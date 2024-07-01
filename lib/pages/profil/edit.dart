import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/auth_cubit.dart';
import 'package:mugi/cubit/auth_state.dart';
import 'package:mugi/models/data_user.dart';
import 'package:mugi/shared/widgets/dialog_error.dart';
import 'package:mugi/shared/widgets/dialog_success.dart';
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

  late String jenisKelamin;

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
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogSuccess(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }
                if (state is AuthFailed) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogError(
                        message: state.message,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }
              },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Wajib Diisi";
                            }
                            return null;
                          },
                        ),
                        Input(
                          label: "Email",
                          icon: const Icon(Icons.email),
                          hintText: "Masukkan Email",
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Wajib Diisi";
                            }
                            return null;
                          },
                        ),
                        Input(
                          label: "Ganti Password",
                          icon: const Icon(Icons.lock),
                          hintText: "Masukkan Password Baru",
                          controller: password,
                          obscureText: true,
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
                          value: jenisKelamin,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Wajib Diisi";
                            }
                            return null;
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Wajib Diisi";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FilledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().updateUser(
                                    DataUser(
                                      nama: nama.text,
                                      email: email.text,
                                      password: password.text,
                                      jk: jenisKelamin,
                                      noHp: noHP.text,
                                    ),
                                  );
                            }
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
