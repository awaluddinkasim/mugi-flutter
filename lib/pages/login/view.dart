import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/auth_cubit.dart';
import 'package:mugi/cubit/auth_state.dart';
import 'package:mugi/cubit/riwayat_cubit.dart';
import 'package:mugi/models/data_login.dart';
import 'package:mugi/pages/home/view.dart';
import 'package:mugi/pages/login/controller.dart';
import 'package:mugi/pages/register/view.dart';
import 'package:mugi/shared/widgets/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends LoginController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Masuk akun",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Masuk menggunakan akun yang terdaftar",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        context.read<RiwayatCubit>().getRiwayat();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (state is AuthFailed) {
                          Future.delayed(Duration.zero, () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                              ),
                            );
                          });
                        }
                        return Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Input(
                                label: "Email",
                                controller: email,
                                icon: const Icon(Icons.email),
                                hintText: "Masukkan email",
                                keyboardType: TextInputType.emailAddress,
                              ),
                              Input(
                                label: "Password",
                                controller: password,
                                icon: const Icon(Icons.lock),
                                hintText: "Masukkan password",
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FilledButton(
                                onPressed: () {
                                  context.read<AuthCubit>().login(
                                        DataLogin(
                                          email: email.text,
                                          password: password.text,
                                        ),
                                      );
                                },
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Belum punya akun?",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Daftar Disini",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
