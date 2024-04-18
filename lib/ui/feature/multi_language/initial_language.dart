import 'package:devkitflutter/cubit/language/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialLanguage extends StatefulWidget {
  final Widget child;

  const InitialLanguage({super.key, required this.child});

  @override
  State<InitialLanguage> createState() => _InitialLanguageState();
}

class _InitialLanguageState extends State<InitialLanguage> {
  late LanguageCubit _languageCubit;

  @override
  void initState() {
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
    _getLocale().then((val) {
      _languageCubit.changeLanguage(val);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<Locale> _getLocale() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? lCode = pref.getString('lCode');
    String? cCode = pref.getString('cCode');
    return Locale(lCode, cCode);
    }
}
