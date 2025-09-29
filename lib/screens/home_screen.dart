import 'package:flutter/material.dart';

import 'package:practice_app/router/app_routes.dart';
import 'package:practice_app/screens/screens.dart';


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

            Image.asset('assets/Landscape.jpg', fit: BoxFit.cover),

            Container(
              color: Colors.blue.shade100,
              height: size.height * .5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: menuOptions.length,
                  separatorBuilder: (_ , __) => Divider(),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(menuOptions[index].name),
                    subtitle: Text(menuOptions[index].description),
                    leading: Icon(menuOptions[index].icon, color: Colors.teal),
                    onTap: () => Navigator.pushNamed(context, menuOptions[index].route),
                  ),
                ),
              ),
            ),

            IconButton(
              onPressed: () {
                //NAVEGACION NORMAL
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ListaDinamicaScreen(),
                  ),
                );
              }, 
              icon: Icon(Icons.add)
            )

          ],
        ),
      )
    );
  }
}