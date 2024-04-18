import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'firestore_state.dart';

class FirestoreCubit extends Cubit<FirestoreState>{
  FirestoreCubit() : super(FirestoreInitial());

  void refreshData(){
    emit(RefreshSuccess());
  }
}