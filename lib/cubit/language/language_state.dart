part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState{}

class ChangeLanguageSuccess extends LanguageState{
  final dynamic locale;
  ChangeLanguageSuccess(this.locale);
}