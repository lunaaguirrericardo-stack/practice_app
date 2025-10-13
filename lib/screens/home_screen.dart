import 'package:flutter/material.dart';

import 'package:practice_app/screens/exports_screens.dart';
import 'package:practice_app/widgets/exports_widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Imagen con CustomText encima
            SizedBox(
              height: size.height * 0.25,
              width: double.infinity,
              child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/Landscape.jpg', fit: BoxFit.cover),
                // CustomText centrado sobre la imagen
                Positioned(
                  bottom: 10, // distancia desde la parte inferior
                  left: 15,   // distancia desde la parte izquierda
                  child: customText(
                  text: '¡Bienvenido!',
                  fontSize: 30,
                  color: Colors.white,
                  textAlign: TextAlign.left,
                  ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  customText(
                    text: '¿Que te gustaría hacer?',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
              
                  Divider(),
              
                  //LISTAS
                  menuTile(
                    size: size, 
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => ListaDinamicaScreen(),
                        ),
                      );       
                    },
                    title: 'Lista dinámica', 
                    image: 'assets/image1.jpg', 
                    subtitle: 'Se muestra ejemplo de lista dinámica'
                  ),
              
                  Divider(),
              
                  menuTile(
                    size: size, 
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => FormulariosScreen(),
                        ),
                      );       
                    },
                    title: 'Formulario', 
                    image: 'assets/image2.jpg', 
                    subtitle: 'Se muestra ejemplo de un formulario'
                  ),
              
                  Divider(),
              
                  menuTile(
                    size: size, 
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => DependenciasExternasScreen(),
                        ),
                      );       
                    },
                    title: 'Dependencias Externas', 
                    image: 'assets/image3.jpg', 
                    subtitle: 'Descripción de las dependencias externas'
                  ),
              
                  Divider(),
              
                  menuTile(
                    size: size, 
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => ConsumoApiScreen(),
                        ),
                      );       
                    },
                    title: 'Consumo Api', 
                    image: 'assets/image4.jpg', 
                    subtitle: 'Descripción del consumo de API'
                  ),
              
                  Divider(),

                ],
              ),
            ),

            
           

          ],
        ),
      ),
      
    );

  }
}