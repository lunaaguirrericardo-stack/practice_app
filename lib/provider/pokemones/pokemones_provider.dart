import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/constants/constants.dart';
import 'package:practice_app/models/exports_models.dart';

class PokemonesProvider with ChangeNotifier {

  PokemonesModel? _pokemones;
  PokemonesModel? get pokemones => _pokemones;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getPokemones() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('$apiBase/pokemon?limit=10&offset=0'),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        log('Response successful: ${response.statusCode}');
        
        final data = json.decode(response.body);
        _pokemones = PokemonesModel.fromJson(data);
        
        log('Pokémon data loaded successfully');
      } else {
        _errorMessage = 'Error del servidor: ${response.statusCode}';
        log('Server error: ${response.statusCode} - ${response.reasonPhrase}');
      }

    } catch (e) {
      _errorMessage = 'Error de conexión: $e';
      log('Error en getPokemones: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Método para limpiar errores
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  PokemonModel? _pokemon;
  PokemonModel? get pokemon => _pokemon;

  Future<void> getPokemon({required String name}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('$apiBase/pokemon/$name'),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        log('Response successful: ${response.statusCode}');
        
        final data = json.decode(response.body);
        _pokemon = PokemonModel.fromJson(data);
        
        log('Pokémon data loaded successfully');
      } else {
        _errorMessage = 'Error del servidor: ${response.statusCode}';
        log('Server error: ${response.statusCode} - ${response.reasonPhrase}');
      }

    } catch (e) {
      _errorMessage = 'Error de conexión: $e';
      log('Error en getPokemones: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}