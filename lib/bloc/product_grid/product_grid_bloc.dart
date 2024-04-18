import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devkitflutter/model/integration/product_grid_model.dart';
import 'package:devkitflutter/network/api_provider.dart';
import './bloc.dart';

class ProductGridBloc extends Bloc<ProductGridEvent, ProductGridState> {
  ProductGridBloc() : super(InitialProductGridState()){
    on<GetProductGrid>(_getProductGrid);
  }
}

void _getProductGrid(GetProductGrid event, Emitter<ProductGridState> emit) async {
  ApiProvider apiProvider = ApiProvider();

  emit(ProductGridWaiting());
  try {
    List<ProductGridModel> data = await apiProvider.getProductGrid(event.sessionId, event.skip, event.limit, event.apiToken);
    emit(GetProductGridSuccess(productGridData: data));
  } catch (ex){
    if(ex != 'cancel'){
      emit(ProductGridError(errorMessage: ex.toString()));
    }
  }
}