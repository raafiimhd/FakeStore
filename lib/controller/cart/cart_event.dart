part of 'cart_bloc.dart';

 class CartListEvent {}

 class GetCartEvent extends CartListEvent {}

class UpdateCartEvent extends CartListEvent {
  final bool add;
  final FakeStore product;

  UpdateCartEvent({required this.add, required this.product});
}
