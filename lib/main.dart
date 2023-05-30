import 'package:flutter/material.dart';
import "package:check_list_app/pages/widget_tree.dart";
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://ylgrzrxgiaaqqmhvfjqs.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlsZ3J6cnhnaWFhcXFtaHZmanFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU0NjM4NjksImV4cCI6MjAwMTAzOTg2OX0.HgorD03E-5tbc5j6aPQHUQtUpPFnCj5uwTVTSlGEnt8');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const WidgetTree(),
    );
  }
}
