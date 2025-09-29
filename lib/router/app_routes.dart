import 'package:flutter/material.dart';
import 'package:practice_app/models/models.dart';
import 'package:practice_app/screens/screens.dart';


//Se agrega un underscore al inicio de la clase si se desea hacer privado
class AppRoutes {

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'lista_dinamica', name: 'ListaDinamica', screen: ListaDinamicaScreen(), icon: Icons.add_to_photos_outlined, description: 'Descripción de la lista dinámica'),
    MenuOption(route: 'formulario', name: 'Formulario', screen: FormulariosScreen(), icon: Icons.input_outlined, description: 'Descripción del formulario'),
    MenuOption(route: 'dependencias', name: 'DependenciasExternas', screen: DependenciasExternasScreen(), icon: Icons.add_box_outlined, description: 'Descripción de las dependencias externas'),
    MenuOption(route: 'consumo', name: 'ConsumoApi', screen: ConsumoApiScreen(), icon: Icons.auto_awesome_outlined, description: 'Descripción del consumo de API')
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