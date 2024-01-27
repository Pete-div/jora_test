// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final bool? isFilled;

  // ignore: use_key_in_widget_constructors
  const CommonButton(
      {required this.text,
      required this.onPressed,
      this.width,
      this.height,
      this.isFilled = true});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      onPressed: onPressed,
      minWidth: width ?? Get.width / 1.8,
      height: height ?? 50,
      color: isFilled == true ? Colors.black : Colors.white,
      child: Text(
        text,
        
        textAlign: TextAlign.center,
        textScaleFactor: 1.0,
        // style: const TextStyle(fontSize: 16, color: Colors.white),
        style: isFilled == true
            ? TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w700)
            : TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w700),
        maxLines: 2,
      ),
    );
  }
}