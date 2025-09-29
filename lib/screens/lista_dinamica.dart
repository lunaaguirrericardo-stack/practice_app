import 'package:flutter/material.dart';

class ListaDinamicaScreen extends StatelessWidget {
   
  const ListaDinamicaScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    Map<dynamic, dynamic> listaDinamica = {
      'Clave' : 'Nombre',
      'Version' : 'Version',
      'PLataforma' : 'Plataforma',
      'Framwork' : 'Framework',
      'Ciudad' : 'Ciudad',
    };  
      
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