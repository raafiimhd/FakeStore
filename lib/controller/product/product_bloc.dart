
import 'package:fake_store_api/controller/api.dart';
import 'package:fake_store_api/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';


class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  ProductsBloc() : super(ProductInitial()) {
    on<GetDataEvent>((event, emit) async {
      emit(ProductState(store: []));
      final products = await Api().getall();
      return emit(ProductState(store: products));
    });
  }
}
