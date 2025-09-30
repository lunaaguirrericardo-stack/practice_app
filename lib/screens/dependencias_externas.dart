import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/widgets/custom_text.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class DependenciasExternasScreen extends StatefulWidget {
   
  const DependenciasExternasScreen({super.key});

  @override
  State<DependenciasExternasScreen> createState() => _DependenciasExternasScreenState();
}

class _DependenciasExternasScreenState extends State<DependenciasExternasScreen> {

    bool isSelected = false;

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: Text('Dependencias Externas'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomCard(
                elevation: 1,
                borderRadius: 15,
                width: !isSelected ? size.width * .8 : size.width * .6,
                height: !isSelected ? size.height * .1 : size.height * .2,
                borderColor: !isSelected ? Colors.indigo : Colors.red,
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: Center(child: customText(text: 'Cerrar', fontSize: 18)),
              ),

              if(isSelected)
                AnimatedIconButton(
                  size: 100,
                  onPressed: () {},
                  duration: const Duration(milliseconds: 500),
                  splashColor: Colors.transparent,
                  icons: const <AnimatedIconItem>[
                    AnimatedIconItem(
                      icon: Icon(Icons.add, color: Colors.purple),
                    ),
                    AnimatedIconItem(
                      icon: Icon(Icons.close, color: Colors.purple),
                    ),
                  ],
                ),
            ],
          ),
        ),
      )

    );
  }
}