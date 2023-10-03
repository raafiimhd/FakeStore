import 'package:flutter/material.dart';

class HomeSectionMain extends StatelessWidget {
  const HomeSectionMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage('assets/8047540.jpg'),fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(13),
          border: Border.all(width: .2)
        ),
      ),
    );
  }
}
