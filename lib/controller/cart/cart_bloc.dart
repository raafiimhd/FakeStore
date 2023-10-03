
import 'package:fake_store_api/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartListBloc extends Bloc<CartListEvent, CartListState> {
  CartListBloc() : super(CartInitial()) {
    on<UpdateCartEvent>((event, emit) {
      event.add
          ? state.cart.add(event.product)
          : state.cart.remove(event.product);
      emit(CartListState(cart: state.cart));
    });

    on<GetCartEvent>((event, emit) {
      emit(CartListState(cart: state.cart));
    });
  }
}
