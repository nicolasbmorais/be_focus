import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Acesso à instância singleton
  factory SharedPreferencesService() {
    return _instance;
  }

  // Construtor privado
  SharedPreferencesService._internal();
  // Instância singleton
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  // Instância do SharedPreferences
  SharedPreferences? _prefs;

  // Inicializa o SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Métodos para salvar valores
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  Future<void> clear() async {
    await _prefs?.clear();
  }
}
