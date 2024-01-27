import 'package:flutter/material.dart';


class HeaderWidget extends StatelessWidget {
  final String img;
  const HeaderWidget({
    super.key,
    required this. img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       shape: BoxShape.circle,
       border: Border.all(width: 0.2,color: Colors.grey)
     ),
     child: Padding(
       padding: const EdgeInsets.all(4.0),
       child: Image.asset(img),
     ));
  }
}