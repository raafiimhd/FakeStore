import 'package:fake_store_api/controller/api.dart';
import 'package:fake_store_api/model/model.dart';
import 'package:fake_store_api/view/about/widgets/bottom_section_button.dart';
import 'package:fake_store_api/view/about/widgets/lists_properties.dart';
import 'package:fake_store_api/view/about/widgets/price_section.dart';
import 'package:fake_store_api/view/cart/shoping_cart.dart';
import 'package:flutter/material.dart';

List<FakeStore> storeList = [];

class FullDetails extends StatelessWidget {
  const FullDetails({Key? key, required this.data}) : super(key: key);
  final FakeStore data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1  ,shadowColor: const Color.fromARGB(248, 250, 250, 250),
        actions: [
          IconButton(
            onPressed: () {
              // Api().putData(data.id);
              Api().putData(product: data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShoppingCart()));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [ 
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10,top: 15),
              child: ListView(
                children: [
                  Container(
                    height: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(data.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Divider(),
                  Text(
                    data.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Row(
                        children: icons,
                      ),
                      const Text(
                        "12,333 ratings",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  PriceSection(data: data),
                  Text(
                    data.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ButtonSectionBottom(data: data),
          ],
        ),
      ),
    );
  }
}
