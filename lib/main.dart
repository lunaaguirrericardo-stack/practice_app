import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practice_app/router/app_routes.dart';
import 'package:practice_app/provider/exports_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Practice app',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),

        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
        ),
        
      ),
    );
  }
}