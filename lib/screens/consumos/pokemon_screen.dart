import 'package:flutter/material.dart';
import 'package:practice_app/provider/exports_provider.dart';
import 'package:practice_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatefulWidget {
    final String name;
  const PokemonScreen({super.key, required this.name});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {

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
    final pokemonProvider = Provider.of<PokemonesProvider>(context);
    return Scaffold(

      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
                Image.network(pokemonProvider.pokemon?.sprites.other!.officialArtwork.frontDefault.toString() ?? '', fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}