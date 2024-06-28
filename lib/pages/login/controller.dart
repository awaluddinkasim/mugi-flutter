import 'package:flutter/material.dart';
import 'package:mugi/pages/login/view.dart';

abstract class LoginController extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
}
