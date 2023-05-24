import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  const CustomTextButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          colors: [
            AppColor.primaryColor,
            AppColor.primaryDark,
          ],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          shadowColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: const TextStyle(
            color: AppColor.whiteColor,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
