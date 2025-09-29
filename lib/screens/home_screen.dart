import 'package:flutter/material.dart';
import 'package:practice_app/router/app_routes.dart';
import 'package:practice_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final menuOptions= AppRoutes.menuOptions;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
     body: SizedBox(
     height: size.height,
     child: Column(
      children: [
        // Imagen con CustomText encima
        SizedBox(
          height: size.height * 0.25,
          width: double.infinity,
          child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
             'assets/Landscape.jpg',
              fit: BoxFit.cover,
            ),
              // CustomText centrado sobre la imagen
            Positioned(
               bottom: 20, // distancia desde la parte inferior
               left: 20,   // distancia desde la parte izquierda
               child: CustomText(
               text: '¡Bienvenido!',
               fontSize: 22,
               color: Colors.white,
               textAlign: TextAlign.left,
               ),
               ),
            ],
          ),
        ),
        
        SizedBox(height: 10),

        Container( 
          margin: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: '¿Que te gustaría hacer?',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.left,
            ),
        ),
          
        // Contenedor inferior con ListView
        SizedBox(
          height: size.height * 0.5,

          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),

            child: ListView.separated(
              itemCount: menuOptions.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) => ListTile(

                title: CustomText(
                  text: menuOptions[index].name,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),

                subtitle: CustomText(
                  text: menuOptions[index].description,
                  fontSize: 13,
                  color: Colors.grey[700]!,
                ),

                leading: SizedBox(
                  width: 50,  // Ajusta según el tamaño deseado
                  height: 50, // Ajusta según el tamaño deseado
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                    menuOptions[index].imagePath, // Asegúrate de tener la ruta de la imagen
                    fit: BoxFit.cover,
                     ),
                  ),
                ),

                     onTap: () => Navigator.pushNamed(
                    context, menuOptions[index].route),
              ),
            ),
          ),
        ),

      ],
    ),
  ),
);

  }
}