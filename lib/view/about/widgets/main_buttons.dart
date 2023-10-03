
import 'package:fake_store_api/model/model.dart';
import 'package:flutter/material.dart';

class MainButtons extends StatelessWidget {
  const MainButtons({
    super.key,
    required this.data,
    required this.buttonTitle,
    this.function,
    required this.icon,
    required this.buttonColor,
  });
  final String buttonTitle;
  final FakeStore data;
  final Function()? function;
  final IconData icon;
  final MaterialStatePropertyAll<Color> buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 50,
      child: TextButton.icon(
        style: ButtonStyle(
          backgroundColor: buttonColor,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: function,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          buttonTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
