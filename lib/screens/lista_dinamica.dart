import 'package:flutter/material.dart';

class ListaDinamicaScreen extends StatelessWidget {
   
  const ListaDinamicaScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Dinamica'),
      ),
      body: Center(
         child: Text('ListaDinamica'),
      ),
    );
  }
}