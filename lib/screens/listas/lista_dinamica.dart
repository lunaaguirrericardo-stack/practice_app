import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:practice_app/widgets/widgets.dart';

class ListaDinamicaScreen extends StatefulWidget {
   
  const ListaDinamicaScreen({super.key});

  @override
  State<ListaDinamicaScreen> createState() => _ListaDinamicaScreenState();
}

class _ListaDinamicaScreenState extends State<ListaDinamicaScreen> {

  Map<dynamic, dynamic> listaDinamica = {
      'Nombre' : 'Ricardo',
      'Version' : '3.0',
      'Plataforma' : 'Flutter',
      'IDE' : 'Visual Studio Code',
      'Ciudad' : 'Colima',
    };  

    List<String> listaDinamica2 = [
      'Erick',
      '4.0',
      'Dart',
      'IntelliJ',
      'Queseria',
    ];

  // Método para mostrar un SnackBar (mensaje en la parte inferior)
  void _mostrarSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('¡Información mostrada correctamente!'),
        backgroundColor: Colors.indigo,
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Cerrar',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  // Método para mostrar un diálogo de alerta
  void _mostrarDialogoAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Información'),
          content: Text('Esto es una prueba de alerta.'),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Cerrar alerta',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: customText(text: 'Lista'),
        actions: [
          IconButton(
            onPressed: () {
              _mostrarSnackBar(context);
            },
            icon: Icon(Icons.info_outline_rounded),
          ),
          IconButton(
            onPressed: () {
              _mostrarDialogoAlerta(context);
            },
            icon: Icon(Icons.warning_amber_rounded),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

            SizedBox(height: size.height * 0.01),

            Center(
              child: Text(
                'Lista Dinámica de elementos (Mapa)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(height: size.height * 0.01),
        
        //Sizebox es el contenedor invisible que limita el tamaño del ListView
            SizedBox(
              height: size.height * 0.4,
              child: ListView.builder(
                itemCount: listaDinamica.length,
                itemBuilder: (context, index) => CustomCard(
                  elevation: 1,
                  borderRadius: 10,
                  child: ListTile(
                    leading: customText(text: '${index + 1}'),
                    title: customText(text: 'Clave: ${listaDinamica.keys.elementAt(index)}'),
                    subtitle: customText(text: 'Valor: ${listaDinamica.values.elementAt(index)}'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.indigo,),
                  ),
                )
              )
            ),

            SizedBox(height: size.height * 0.01),

            Center(
              child: Text(
                'Lista Dinámica de elementos (Lista)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

             SizedBox(
              height: size.height * 0.4,
              child: ListView.builder(
                itemCount: listaDinamica2.length,
                itemBuilder: (context, index) => CustomCard(
                  elevation: 1,
                  borderRadius: 10,
                  child: ListTile(
                    leading: customText(text: '${index + 1}'),
                    title: customText(text: 'Contenido: ${listaDinamica2.elementAt(index)}'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.indigo,),
                  ),
                )
              )
            ),


          ],
        ),
      ),
    );
  }
}