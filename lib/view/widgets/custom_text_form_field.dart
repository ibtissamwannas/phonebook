import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phonebook/core/constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  // final String svgPicture;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  final bool isNumber;
  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      // required this.svgPicture,
      required this.myController,
      this.validator,
      required this.isNumber})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColor.black,
      ),
      keyboardType: widget.isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      controller: widget.myController,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
