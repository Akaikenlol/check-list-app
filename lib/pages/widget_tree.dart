import 'package:flutter/material.dart';
import 'package:check_list_app/pages/home.dart';
import 'package:check_list_app/pages/login_sign.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
