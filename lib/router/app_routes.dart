import 'package:flutter/material.dart';
import 'package:practice_app/models/models.dart';
import 'package:practice_app/screens/screens.dart';


//Se agrega un underscore al inicio de la clase si se desea hacer privado
class AppRoutes {

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'lista_dinamica', name: 'Lista Dinámica', screen: ListaDinamicaScreen(), imagePath: 'assets/image1.jpg', description: 'Se muestra ejemplo de lista dinámica'),
    MenuOption(route: 'formulario', name: 'Formulario', screen: FormulariosScreen(), imagePath: 'assets/image2.jpg', description: 'Se muestra ejemplo de un formulario'),
    MenuOption(route: 'dependencias', name: 'Dependencias Externas', screen: DependenciasExternasScreen(), imagePath: 'assets/image3.jpg', description: 'Descripción de las dependencias externas'),
    MenuOption(route: 'consumo', name: 'Consumo Api', screen: ConsumoApiScreen(), imagePath: 'assets/image4.jpg', description: 'Descripción del consumo de API')
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){

    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home' :  (BuildContext context) => HomeScreen()});
   
    //Creamos una iteración de for para añadir los elementos de la lista menuOPtions al mapa appRoutes
      for (final option in menuOptions){
        appRoutes.addAll({option.route :  (BuildContext context) => option.screen});
    }
   
    return appRoutes;

  }

        static Route<dynamic> onGenerateRoute ( RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

    }
} 