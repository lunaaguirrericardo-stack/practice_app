import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:practice_app/provider/exports_provider.dart';
import 'package:practice_app/screens/consumos/pokemon_screen.dart';
import 'package:practice_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ConsumoApiScreen extends StatefulWidget {
   
  const ConsumoApiScreen({super.key});

  @override
  State<ConsumoApiScreen> createState() => _ConsumoApiScreenState();
}

class _ConsumoApiScreenState extends State<ConsumoApiScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pokemonesProvider = Provider.of<PokemonesProvider>(context, listen: false);
      pokemonesProvider.getPokemones();
    });
  }

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      final pokemonesProvider = Provider.of<PokemonesProvider>(context);
    return Scaffold(  

      appBar: AppBar(title: customText(text: 'Consumo API')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(text: 'Lista de pokemones', fontSize: 20),
            SizedBox(height: size.height * 0.02),

            SizedBox(
              height: size.height * 0.8,
              width: size.width,
              child: ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: pokemonesProvider.pokemones?.results.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemonesProvider.pokemones?.results[index];

                  return CustomCard(
                    elevation: 1,
                    borderRadius: 10,
                    childPadding: 0,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        trailing: IconButton(
                          onPressed: () {
                            // Navegación básica - va a la pantalla y permite volver
                            Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => PokemonScreen(name: pokemon!.name),
                                ),
                              );
                        
                          }, 
                          icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.indigo)
                        ),
                        leading: customText(text: '${index + 1}'),
                        title: customText(text: 'Nombre: ${pokemon?.name}'),
                        subtitle: customText(text: 'URL: ${pokemon?.url}'),
                      ),
                    ),
                  );
                }
              )
            ),


          ],
         ),
      ),



    );
  }
}