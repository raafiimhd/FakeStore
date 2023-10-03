import 'package:fake_store_api/controller/product/product_bloc.dart';
import 'package:fake_store_api/core/colors.dart';
import 'package:fake_store_api/view/about/full_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSectionList extends StatelessWidget {
  const HomeSectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<ProductsBloc, ProductState>(
        builder: (context, state) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemCount: state.store.length,
            itemBuilder: (context, index) {
              final product = state.store[index];
                return Padding(
                padding: const EdgeInsets.only(
                    left: 7, right: 7, bottom: 10, top: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: .2,
                      color: const Color.fromARGB(255, 31, 31, 31),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullDetails(data: product),
                            ),
                          );
                        },
                        child: Container(
                          height: 130,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                product.image,
                              ),
                            ),
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          product.title,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 18,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 20, 160, 7),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5, top: 2),
                              child: Text(
                                '65% off',
                                style: TextStyle(
                                    fontSize: 10, color: whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          children: [
                            Text(
                              " \$${product.price}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[600],
                            ),
                            const Text(
                              "4.5",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), 
                )); 
          },
         ); 
      }
      ),
    );
            }
}
