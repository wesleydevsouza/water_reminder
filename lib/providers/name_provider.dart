import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NomeProvider with ChangeNotifier {
  String? _name = '';

  String? get nome => _name;

  NomeProvider() {
    _loadConfig();
  }

  void setConfig(String value) {
    _name = value;
    _saveConfig(value);
    notifyListeners();
  }

  void _loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('config');
    notifyListeners();
  }

  void _saveConfig(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('config', value);
  }
}
