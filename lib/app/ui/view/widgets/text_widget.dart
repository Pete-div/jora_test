import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkSanText extends StatelessWidget {
 final String? text;
  final FontWeight? weight;
  final double size;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextDecoration? decoration;

  const WorkSanText(this.text,
      {Key? key,
      this.weight,
      this.size = 14,
      this.color,
      this.textAlign,
      this.maxLines,
      this.decoration,
      this.height = 16,
      this.softWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Text(
      text ?? '-',
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: GoogleFonts.workSans(
        fontWeight: weight ?? FontWeight.w400,
        fontSize: size,
        color: color ?? Colors.black,
        height: height?.toFigmaHeight(size),
        decoration: decoration,
      ),
    );
  }
}

extension FigmaDimention on double {
  double toFigmaHeight(double fontSize) {
    return this / fontSize;
  }
}