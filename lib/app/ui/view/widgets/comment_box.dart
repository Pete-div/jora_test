import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jora_test_app/app/ui/view/widgets/text_formfield.dart';
import 'package:jora_test_app/app/ui/view/widgets/text_widget.dart';

class CommentBox extends StatefulWidget {
   CommentBox({
    super.key,
    required this.commentContrl,
  });

  final TextEditingController commentContrl;
  int _characterCount =0;

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextField(controller: widget.commentContrl,
        hintText: 'Enter Text',
        maxlines: 5,
        bordercolor: Colors.grey,
        radius: 7,
                   inputFormatters: [LengthLimitingTextInputFormatter(200)],
              
         onChanged: (text) {
                     setState(() {
                                          widget._characterCount = text.length;
        
                     });
                      
                    },
        ),
         Align(
                    alignment: Alignment.centerRight,
                    child: WorkSanText("${widget._characterCount}/200",weight: FontWeight.w500,size: 12,height: 19.1,color: Color(0xffC2C7D6),)),
             
      ],
    );
  }
}