import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devkitflutter/model/integration/product_listview_model.dart';
import 'package:devkitflutter/network/api_provider.dart';
import './bloc.dart';

class ProductListviewBloc extends Bloc<ProductListviewEvent, ProductListviewState> {
  ProductListviewBloc() : super(InitialProductListviewState()){
    on<GetProductListview>(_getProductListview);
  }
}

void _getProductListview(GetProductListview event, Emitter<ProductListviewState> emit) async {
  ApiProvider apiProvider = ApiProvider();

  emit(ProductListviewWaiting());
  try {
    List<ProductListviewModel> data = await apiProvider.getProductListview(event.sessionId, event.skip, event.limit, event.apiToken);
    emit(GetProductListviewSuccess(productListviewData: data));
  } catch (ex){
    if(ex != 'cancel'){
      emit(ProductListviewError(errorMessage: ex.toString()));
    }
  }
}