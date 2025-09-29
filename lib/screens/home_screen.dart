import 'package:flutter/material.dart';
import 'package:practice_app/router/app_routes.dart';


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
            SizedBox(
              height: size.height * .4,
              child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(menuOptions[index].name),
                leading: Icon(menuOptions[index].icon, color: Colors.teal),
                onTap: () {
              
                //final route = MaterialPageRoute(
                //builder: (context) => Listview1Screen()
                //);  
                //Navigator.push(context, route);
              
                Navigator.pushNamed(context, menuOptions[index].route);
              
                },
              ),
              separatorBuilder: (_ , __) => Divider(),
              itemCount: menuOptions.length
              ),
            )
          ],
        ),
      )
    );
  }
}