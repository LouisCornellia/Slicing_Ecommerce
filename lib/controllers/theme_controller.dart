import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final _box = GetStorage();

  final _key = 'isDarkMode';

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  bool get isDarkMode => _loadTheme();
  bool _loadTheme() => _box.read(_key) ?? false;

  void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);
}
