import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practice_app/screens/exports_screens.dart';
import 'package:practice_app/provider/exports_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonesProvider(),
      child: MaterialApp(
        title: 'Practice App',
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
      )
    );
  }
}