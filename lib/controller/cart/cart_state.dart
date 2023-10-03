
part of 'cart_bloc.dart';

class CartListState {
  List<FakeStore> cart;
  CartListState({
    required this.cart,
  });
}

final class CartInitial extends CartListState {
  CartInitial() : super(cart: []);
}
