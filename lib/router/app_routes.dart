import 'package:flutter/material.dart';
import 'package:practice_app/models/models.dart';
import 'package:practice_app/screens/screens.dart';


//Se agrega un underscore al inicio de la clase si se desea hacer privado
class AppRoutes {

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    
    MenuOption(route: 'lista_dinamica', name: 'ListaDinamica', screen: ListaDinamicaScreen(), icon: Icons.add_to_photos_outlined),
    MenuOption(route: 'formulario', name: 'Formulario', screen: FormulariosScreen(), icon: Icons.input_outlined),
    MenuOption(route: 'dependencias', name: 'DependenciasExternas', screen: DependenciasExternasScreen(), icon: Icons.add_box_outlined),
    MenuOption(route: 'consumo', name: 'ConsumoApi', screen: ConsumoApiScreen(), icon: Icons.auto_awesome_outlined)

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