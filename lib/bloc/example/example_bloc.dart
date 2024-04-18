import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devkitflutter/network/api_provider.dart';
import './bloc.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(InitialExampleState()){
    on<GetExample>(_getExample);
    on<PostExample>(_postExample);
  }
}

void _getExample(GetExample event, Emitter<ExampleState> emit) async {
  ApiProvider apiProvider = ApiProvider();

  emit(ExampleWaiting());
  try {
    String data = await apiProvider.getExample(event.apiToken);
    emit(GetExampleSuccess(exampleData: data));
  } catch (ex) {
    if(ex != 'cancel'){
      emit(ExampleError(errorMessage: ex.toString()));
    }
  }
}

void _postExample(PostExample event, Emitter<ExampleState> emit) async {
  ApiProvider apiProvider = ApiProvider();

  emit(ExampleWaiting());
  try {
    String data = await apiProvider.postExample(event.id, event.apiToken);
    emit(PostExampleSuccess(exampleData: data));
  } catch (ex){
    if(ex != 'cancel'){
      emit(ExampleError(errorMessage: ex.toString()));
    }
  }
}