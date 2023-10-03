import 'package:fake_store_api/controller/api.dart';
import 'package:fake_store_api/controller/cart/cart_bloc.dart';
import 'package:fake_store_api/model/model.dart';
import 'package:fake_store_api/view/about/widgets/main_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonSectionBottom extends StatelessWidget {
  const ButtonSectionBottom({
    super.key,
    required this.data,
  });

  final FakeStore data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainButtons(
                buttonColor: const MaterialStatePropertyAll(Colors.black),
                icon: Icons.shopping_cart,
                data: data,
                buttonTitle: 'Add to cart',
                function: () {
                  context
                      .read<CartListBloc>()
                      .add(UpdateCartEvent(add: true, product: data));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Item added to cart successfully'),
          shape: BeveledRectangleBorder(),
          dismissDirection: DismissDirection.endToStart,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ));
                }), 
            MainButtons(
              buttonColor: const MaterialStatePropertyAll( 
                  Color.fromARGB(255, 20, 160, 7)),
              icon: Icons.shopping_cart,
              data: data, 
              buttonTitle: 'Buy Now',
              function: () { 
                Api().postData();
              },
            ),
          ], 
        ),
      ),
    );
  }
}
