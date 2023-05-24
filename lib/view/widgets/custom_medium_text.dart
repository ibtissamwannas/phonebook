import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class CustomMediumText extends StatefulWidget {
  final String text;
  const CustomMediumText({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomMediumText> createState() => _CustomMediumTextState();
}

class _CustomMediumTextState extends State<CustomMediumText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(
        color: AppColor.black,
        fontSize: 15,
      ),
    );
  }
}
