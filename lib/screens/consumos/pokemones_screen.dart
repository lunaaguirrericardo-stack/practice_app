import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:practice_app/provider/exports_provider.dart';
import 'package:practice_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PokemonesScreen extends StatefulWidget {
    final String name;
  const PokemonesScreen({super.key, required this.name});

  @override
  State<PokemonesScreen> createState() => _PokemonesScreenState();
}

class _PokemonesScreenState extends State<PokemonesScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pokemonesProvider = Provider.of<PokemonesProvider>(context, listen: false);
      pokemonesProvider.getPokemon(name: widget.name);
    });
  }

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      final pokemonesProvider = Provider.of<PokemonesProvider>(context);
    return Scaffold(

      appBar: AppBar(title: Text(widget.name)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [

            CustomCard(
              elevation: 0,
              borderRadius: 10,
              borderColor: Colors.indigo,
              width: size.width,
              height: size.height * 0.1,
              child: Center(child: customText(text: 'Experiencia base: ${pokemonesProvider.pokemon?.baseExperience.toString() ?? 'No data'}', fontSize: 20))
            ),

            SizedBox(height: size.height * 0.02),

            CustomCard(
              width: size.width,
              child: Column(
                children: [

                  customText(text: 'Habilidades', fontWeight: FontWeight.bold, fontSize: 22),

                  SizedBox(
                    height: size.height * 0.3,
                    child: ListView.builder(
                      itemCount: pokemonesProvider.pokemon?.abilities.length,
                      itemBuilder: (context, index) {
                        final ability = pokemonesProvider.pokemon?.abilities[index];
                        return CustomCard(
                          elevation: 0,
                          borderRadius: 10,
                          borderColor: Colors.indigo,
                          child: ListTile(
                            leading: customText(text: '${index + 1}'),
                            title: customText(text: 'Nombre: ${ability?.ability?.name}'),
                          ),
                        );
                      }
                    )
                  ),
                ],
              ),
            )
            

          ],
        ),
      )
    );
  }
}