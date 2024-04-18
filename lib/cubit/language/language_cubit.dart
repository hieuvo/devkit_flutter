import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState>{
  LanguageCubit() : super(LanguageInitial());

  void changeLanguage(locale){
    emit(ChangeLanguageSuccess(locale));
  }
}