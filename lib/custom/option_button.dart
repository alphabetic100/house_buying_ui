import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/constant.dart';
import 'package:flutter_application_2/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.width,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorDarkBlue),
          ),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: colorwhite,
              ),
              addHorizontalSpacing(10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  color: colorwhite,
                ),
              )
            ],
          )),
    );
  }
}
