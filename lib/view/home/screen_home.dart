import 'package:fake_store_api/controller/product/product_bloc.dart';
import 'package:fake_store_api/core/colors.dart';
import 'package:fake_store_api/core/const.dart';
import 'package:fake_store_api/view/cart/shoping_cart.dart';
import 'package:fake_store_api/view/home/widgets/home_section_list.dart';
import 'package:fake_store_api/view/home/widgets/home_section_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(GetDataEvent());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.list,
          color: blackColor,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ShoppingCart()));
              },
              icon: const Icon(Icons.local_grocery_store_sharp))
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HomeSectionMain(),
            kHeight10,
            Row(
              children: [
                kwidth15,
                Text(
                  'Latest Arrives',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )
              ],
            ),
            HomeSectionList(),
          ],
        ),
      ),
    );
  }
}
