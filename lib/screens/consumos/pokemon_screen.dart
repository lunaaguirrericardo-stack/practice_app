import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

import 'package:practice_app/models/exports_models.dart';
import 'package:practice_app/widgets/exports_widgets.dart';

class PokemonScreen extends StatefulWidget {
    final PokemonModel pokemon;
  const PokemonScreen({super.key, required this.pokemon});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> with SingleTickerProviderStateMixin {

  bool basic = true;
  bool stats = false;
  bool abilities = false;
  bool sprites = false;

  bool circlesInitialized = false;
  
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bubbleAreaSize = Size(size.width, size.height * .35);
    if (!circlesInitialized) {
      initCircles(bubbleAreaSize);
      circlesInitialized = true;
    }
    return Scaffold(

      backgroundColor: Colors.green,
      appBar: AppBar(backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.white)),

      body: Stack(
        children: [

          // Fondo animado de círculos
          SizedBox(
            width: size.width,
            height: size.height * .35,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                updateCircles(bubbleAreaSize);
                return CustomPaint(
                  size: bubbleAreaSize,
                  painter: CirclesPainter(circles),
                );
              },
            ),
          ),

          SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                //NOMBRE E ID   
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        fontSize: 25,
                        color: Colors.white,
                        text: widget.pokemon.name.toUpperCase(),
                        fontWeight: FontWeight.bold,
                      ),
                      customText(text: '#${widget.pokemon.id.toString()}', fontSize: 20, color: Colors.white)
                    ],
                  ),
                ),
          
                //TYPES
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    height: size.height * 0.05,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.pokemon.types.length,
                      itemBuilder: (context, index) {
                        final type = widget.pokemon.types[index].type.name;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: CustomCard(
                            borderRadius: 10,
                            color: Colors.white70,
                            child: customText(
                              text: type,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                //IMAGE
                Center(
                  child: SizedBox(
                    height: size.height * 0.26,
                    child: Stack(
                      children: [
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return ColorFiltered(
                              // ignore: deprecated_member_use
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.modulate),
                              child: Transform.rotate(
                                angle: _controller.value * 2 * 3.1416,
                                child: Transform.scale(
                                  scale: 1.15,
                                  child: Image.asset('assets/pokebola.png', fit: BoxFit.cover),
                                ),
                              ),
                            );
                          }
                        ),
                        Image.network(widget.pokemon.sprites.other!.officialArtwork.frontDefault.toString(), fit: BoxFit.cover),
                      ],
                    ),
                  ),
                ),
          
                Expanded(
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
          
                          SizedBox(height: size.height * 0.02),
          
                          //MENU DE OPCIONES
                          pokemonMenu(
                            size: size, 
                            basic: basic, 
                            stats: stats,
                            abilities: abilities,
                            sprites: sprites,
                            onTapBasic: () {
                              setState(() {
                                basic = true;
                                stats = false;
                                abilities = false;
                                sprites = false;
                              });
                            },
                            onTapStats: () {
                              setState(() {
                                basic = false;
                                stats = true;
                                abilities = false;
                                sprites = false;
                              });
                            },
                            onTapAbilities: () {
                              setState(() {
                                basic = false;
                                stats = false;
                                abilities = true;
                                sprites = false;
                              });
                            },
                            onTapSprites: () {
                              setState(() {
                                basic = false;
                                stats = false;
                                abilities = false;
                                sprites = true;
                              });
                            },
                          ),
                          
                          SizedBox(height: size.height * 0.02),
          
                          if(basic) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
          
                                  richText(
                                    text1: 'Name: ', 
                                    textSize1: 20,
                                    textColor1: Colors.grey,
                                    fontWeight1: FontWeight.w500,
                                    text2: widget.pokemon.name.toUpperCase(),
                                    textSize2: 20,
                                  ),
          
                                  SizedBox(height: size.height * 0.02),
          
                                  richText(
                                    text1: 'Base experience: ', 
                                    textSize1: 20,
                                    textColor1: Colors.grey,
                                    fontWeight1: FontWeight.w500,
                                    text2: widget.pokemon.baseExperience.toString(),
                                    textSize2: 20,
                                  ),
          
                                  SizedBox(height: size.height * 0.02),
          
                                  CustomCard(
                                    elevation: 2,
                                    borderRadius: 10,
                                    width: size.width,
                                    borderColor: Colors.green,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            title: customText(text: 'Height: ', fontSize: 18, color: Colors.grey),
                                            subtitle: customText(
                                              text: widget.pokemon.height.toString(), 
                                              fontSize: 18, 
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            title: customText(text: 'Weight: ', fontSize: 18, color: Colors.grey),
                                            subtitle: customText(
                                              text: widget.pokemon.weight.toString(), 
                                              fontSize: 18, 
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
          
                                ],
                              ),
                            )
                          ],
          
                          if(stats) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var stat in widget.pokemon.stats) 
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          customText(
                                            text: stat.stat.name.toUpperCase(), 
                                            fontSize: 18, 
                                            fontWeight: FontWeight.bold
                                          ),
                                          SizedBox(height: size.height * 0.01),
                                          LinearProgressIndicator(
                                            value: stat.baseStat / 100,
                                            backgroundColor: Colors.grey[300],
                                            color: Colors.green,
                                            minHeight: 10,
                                          ),
                                          SizedBox(height: size.height * 0.005),
                                          customText(
                                            text: 'Base Stat: ${stat.baseStat}', 
                                            fontSize: 16, 
                                            color: Colors.grey[600]
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            )
                          ],
          
                          if(abilities) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var ability in widget.pokemon.abilities) 
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: customText(
                                        text: ability.ability!.name.toUpperCase(), 
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                ],
                              ),
                            )
                          ],
          
                          if(sprites) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
          
                                  customText(text: 'Showdown Sprites', fontSize: 20, fontWeight: FontWeight.bold),
          
                                  SizedBox(height: size.height * 0.02),
          
                                  CustomCard(
                                    elevation: 2,
                                    borderRadius: 10,
                                    width: size.width,
                                    borderColor: Colors.green,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
          
                                        if (widget.pokemon.sprites.other?.showdown.frontDefault != null)
                                          Column(
                                            children: [
                                              Image.network(
                                                widget.pokemon.sprites.other!.showdown.frontDefault,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.contain,
                                              ),
                                              customText(text: 'Front', fontSize: 14)
                                            ],
                                          ),
                                    
                                        if (widget.pokemon.sprites.other?.showdown.backDefault != null)
                                          Column(
                                            children: [
                                              Image.network(
                                                widget.pokemon.sprites.other!.showdown.backDefault,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.contain,
                                              ),
                                              customText(text: 'Back', fontSize: 14)
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
          
                                  SizedBox(height: size.height * 0.02),
          
                                  CustomCard(
                                    elevation: 2,
                                    borderRadius: 10,
                                    width: size.width,
                                    borderColor: Colors.green,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if (widget.pokemon.sprites.other?.showdown.frontShiny != null)
                                          Column(
                                            children: [
                                              Image.network(
                                                widget.pokemon.sprites.other!.showdown.frontShiny,
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.contain,
                                              ),
                                              customText(text: 'Front Shiny', fontSize: 14)
                                            ],
                                          ),
                                    
                                        if (widget.pokemon.sprites.other?.showdown.backShiny != null)
                                          Column(
                                            children: [
                                              Image.network(
                                                widget.pokemon.sprites.other!.showdown.backShiny,
                                                width: 80,
                                                height: 80,
                                                fit: BoxFit.contain,
                                              ),
                                              customText(text: 'Back Shiny', fontSize: 14)
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
          
                                  SizedBox(height: size.height * 0.02),
                                ],
                              ),
                            )
                          ],
          
          
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}