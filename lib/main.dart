import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mugi/cubit/auth_cubit.dart';
import 'package:mugi/cubit/auth_state.dart';
import 'package:mugi/cubit/diagnosa_cubit.dart';
import 'package:mugi/cubit/gejala_cubit.dart';
import 'package:mugi/cubit/register_cubit.dart';
import 'package:mugi/pages/login/view.dart';
import 'package:mugi/pages/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => GejalaCubit(AuthCubit())),
        BlocProvider(create: (context) => DiagnosaCubit(AuthCubit())),
      ],
      child: MaterialApp(
        title: 'SPK MuGi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          if (state is AuthSuccess) {
            return const AppPage();
          } else if (state is AuthLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return const LoginScreen();
          }
        }),
      ),
    );
  }
}
