import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaterialLocalizationTkDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == "tk";
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? lCode = pref.getString('lCode');
    String? cCode = pref.getString('cCode');

    locale = Locale(lCode, cCode);
      MaterialLocalizationTk localizations = MaterialLocalizationTk();
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(MaterialLocalizationTkDelegate old) {
    return true;
  }
}

class MaterialLocalizationTk extends DefaultMaterialLocalizations {

  static MaterialLocalizationTk? of(BuildContext context) {
    return Localizations.of<MaterialLocalizationTk>(context, MaterialLocalizationTk);
  }

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle.loadString('assets/lang/tk.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }
}