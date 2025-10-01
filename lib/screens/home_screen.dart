import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

import 'package:practice_app/widgets/widgets.dart';
import 'package:practice_app/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
      final menuOptions= AppRoutes.menuOptions;
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
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: customText(
                text: '¿Que te gustaría hacer?',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.left,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(),
            ),
              
            // Contenedor inferior con ListView
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: size.height * 0.55,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: menuOptions.length,
                  separatorBuilder: (_, __) => const Divider(),

                  itemBuilder: (context, index) => ListTile(

                    contentPadding: EdgeInsets.zero,

                    onTap: () => Navigator.pushNamed(context, menuOptions[index].route),
                    
                    title: customText(
                      text: menuOptions[index].name,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                
                    subtitle: customText(
                      text: menuOptions[index].description,
                      fontSize: 13,
                      color: Colors.grey[700]!,
                    ),

                    leading: CustomCard(
                      elevation: 0,
                      childPadding: 0,
                      borderRadius: 10,
                      width: size.width * .15,
                      height: size.width * .15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                        menuOptions[index].imagePath,
                        fit: BoxFit.cover,
                        ),
                      )
                    ),

                    trailing: Icon(Icons.arrow_forward_ios, size: 25),

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