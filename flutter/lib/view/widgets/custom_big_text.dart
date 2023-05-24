import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class CustomBigText extends StatefulWidget {
  final String text;
  const CustomBigText({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomBigText> createState() => _CustomBigTextState();
}

class _CustomBigTextState extends State<CustomBigText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(
        color: AppColor.black,
        fontSize: 22,
      ),
    );
  }
}
