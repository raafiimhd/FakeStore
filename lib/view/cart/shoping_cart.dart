
import 'package:fake_store_api/controller/api.dart';
import 'package:fake_store_api/controller/cart/cart_bloc.dart';
import 'package:fake_store_api/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CartListBloc, CartListState>(
          builder: (context, state) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: state.cart.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: .2)),
                    child: Row(
                      children: [
                        kwidth10,
                        SizedBox(
                            width: 50,
                            child: Image.network(state.cart[index].image)),
                        kwidth10,
                        Text(
                          state.cart[index].title.substring(0, 11),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              // Api().patchData(state.cart[index].id);
                              Api().patchData(product: state.cart[index]);
                            },
                            icon: const Icon(Icons.mode_edit_outline_outlined)),
                        IconButton(
                            onPressed: () {
                              Api().deleteData(state.cart[index].id);
                              context.read<CartListBloc>().add(UpdateCartEvent(
                                  add: false, product: state.cart[index]));
                            },
                            icon: const Icon(Icons.delete_outline)),
                      ],
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
