
import 'package:fake_store_api/model/model.dart';
import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
    required this.data,
  });

  final FakeStore data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${data.price}',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        const Spacer(),
        Container(
          height: 20,
          width: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 20, 160, 7),
            borderRadius: BorderRadius.circular(2),
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 5, top: 2),
            child: Text(
              '65% off',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
