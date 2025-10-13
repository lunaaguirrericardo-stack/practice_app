import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/models/exports_models.dart';
import 'package:provider/provider.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

import 'package:practice_app/widgets/exports_widgets.dart';
import 'package:practice_app/provider/exports_provider.dart';
import 'package:practice_app/screens/consumos/pokemon_screen.dart';

class ConsumoApiScreen extends StatefulWidget {
   
  const ConsumoApiScreen({super.key});

  @override
  State<ConsumoApiScreen> createState() => _ConsumoApiScreenState();
}

class _ConsumoApiScreenState extends State<ConsumoApiScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  final Map<String, PokemonModel> _pokemonCache = {};

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _animationController.repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pokemonesProvider = Provider.of<PokemonesProvider>(context, listen: false);
      pokemonesProvider.getPokemones();
    });

    _preloadImages();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<PokemonModel?> _loadPokemonImage(String name) async {
    if (name.isEmpty) return null;
    
    // Verificar si ya está en cache
    if (_pokemonCache.containsKey(name)) {
      return _pokemonCache[name];
    }
    
    try {
      // final pokemonesProvider = Provider.of<PokemonesProvider>(context, listen: false);
      
      // Crear una instancia temporal para esta llamada específica
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        final pokemon = PokemonModel.fromJson(data);
        
        // Guardar en cache para no volver a hacer la llamada
        _pokemonCache[name] = pokemon;
        
        return pokemon;
      }
    } catch (e) {
      log('Error loading pokemon $name: $e');
    }
    
    return null;
  }

  Future<void> _preloadImages() async {
    final pokemonesProvider = Provider.of<PokemonesProvider>(context, listen: false);
    final results = pokemonesProvider.pokemones?.results;
    
    if (results != null && results.isNotEmpty) {
      // Cargar las primeras 6 imágenes en paralelo
      final futures = results.take(6).map((pokemon) => _loadPokemonImage(pokemon.name));
      await Future.wait(futures);
    }
  }

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      final pokemonesProvider = Provider.of<PokemonesProvider>(context);
    return Scaffold(  

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 228, 0, 0),
        iconTheme: const IconThemeData(color: Colors.white),
        title: customText(text: 'Consumo API', color: Colors.white),
      ),

      body: SizedBox(
        width: size.width,
        height: size.height * .9,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
          
            SizedBox(height: size.height * 0.02),
          
            Center(
              child: SizedBox(
                height: size.height * 0.1,
                child: AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Image.asset('assets/splash_icon.png', fit: BoxFit.contain),
                    );
                  },
                ),
              ),
            ),
          
            SizedBox(height: size.height * 0.02),
          
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 elementos por fila
                  crossAxisSpacing: 8, // Espacio horizontal entre elementos
                  mainAxisSpacing: 8,  // Espacio vertical entre elementos
                  childAspectRatio: 1, // Proporción ancho/alto de cada card
                ),
                itemCount: pokemonesProvider.pokemones?.results.length ?? 0,
                itemBuilder: (context, index) {
                  final pokemon = pokemonesProvider.pokemones?.results[index];
                  return CustomCard(
                    elevation: 2,
                    childPadding: 0,
                    borderRadius: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                          // Número del Pokémon
                          Align(
                            alignment: Alignment.topLeft,
                            child: customText(
                              text: '#${index + 1}',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]!,
                            ),
                          ),
                          
                          // Imagen del Pokémon con FutureBuilder
                          Expanded(
                            flex: 3,
                            child: FutureBuilder<PokemonModel?>(
                              future: _loadPokemonImage(pokemon?.name ?? ''),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                      ),
                                    ),
                                  );
                                }
                                
                                if (snapshot.hasError || !snapshot.hasData) {
                                  return Center(
                                    child: Icon(
                                      Icons.catching_pokemon,
                                      size: 40,
                                      color: Colors.grey[400],
                                    ),
                                  );
                                }
                                
                                final pokemonDetail = snapshot.data!;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PokemonScreen(pokemon: pokemonDetail),
                                      ),
                                    );
                                  },
                                  child: Center(
                                    child: Image.network(
                                      pokemonDetail.sprites.other?.officialArtwork.frontDefault ?? '',
                                      fit: BoxFit.contain,
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                    loadingProgress.expectedTotalBytes!
                                                : null,
                                            strokeWidth: 2,
                                          ),
                                        );
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(
                                          Icons.catching_pokemon,
                                          size: 40,
                                          color: Colors.grey[400],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          
                          // Nombre del Pokémon
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: customText(
                                text: pokemon?.name ?? 'Unknown',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
              
                        ],
                      ),
                    ),
                  );
                },
// ...existing code...
              ),
            ),
            
           ],
          ),
        ),
      ),
    );
  }
}