import 'package:flutter/material.dart';
import "package:check_list_app/pages/widget_tree.dart";
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://umzjzbsyajxgsipodtyr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVtemp6YnN5YWp4Z3NpcG9kdHlyIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU0MjA2MTIsImV4cCI6MjAwMDk5NjYxMn0.VXXDabmrTAu4c4l1ni9WTfdDpTRqOWrfEfJ_BN6cq0o',
  );

  runApp(MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

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
