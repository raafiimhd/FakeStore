
part of 'product_bloc.dart';

class ProductState {
  List<FakeStore> store;
  ProductState({
    required this.store,
  });
}

final class ProductInitial extends ProductState {
  ProductInitial() : super(store: []);
}
