import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jora_test_app/app/controllers/view_consultation_controller.dart';
import 'package:jora_test_app/app/ui/view/widgets/comment_box.dart';
import 'package:jora_test_app/app/ui/view/widgets/commo_button.dart';
import 'package:jora_test_app/app/ui/view/widgets/star_rating.dart';
import 'package:jora_test_app/app/ui/view/widgets/text_widget.dart';

class RateSellerScreen extends GetView<ViewConsultationController> {
   RateSellerScreen({super.key});


 final TextEditingController commentContrl = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(leading: GestureDetector(
          onTap: ()=> Get.back(),
          child: Image.asset('images/eva_arrow-back-outline.png')),
      title: const WorkSanText('Rate Seller',size: 24,weight: FontWeight.w500,height: 28,color:Color(0xff2B2A29),),
      centerTitle: false,
    ),
    body: 
       Obx(()=>
         Padding(
          padding:  const EdgeInsets.symmetric(horizontal:12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const SizedBox(height: 30,),
             Center(
               child: Column(
                children: [
                  Container(height: 60,width:60,
                  decoration:const BoxDecoration(
                  color:  Colors.black,
                  shape: BoxShape.circle
                  )
                  ,child: Image.network(controller.image!),),
                 const SizedBox(height: 20,),
                    WorkSanText(controller.name,weight: FontWeight.w500,size: 20,height: 23.46,color: Color(0xff2B2A29),),
                  const   SizedBox(height: 5,),
                                 WorkSanText(controller.specialization,weight: FontWeight.w400,size: 14,height: 16.2,color: Color(0xff2B2A29),),
              const SizedBox(height: 8,),
               StarRating()           
                ],),
             ),
            const SizedBox(height: 40,),
           const  WorkSanText('Leave a comment',weight: FontWeight.w500,size: 16,height: 21,color: Color(0xff2B2A29),)
                  ,const SizedBox(height: 8,),
                  CommentBox(commentContrl: commentContrl,),        const SizedBox(height: 4,),
                  const  Spacer(),
                 Padding(
                   padding: const EdgeInsets.only(bottom:20.0),
                   child: Column(children: [
                                 CommonButton(text:controller.submitting.value? 'Submitting': 'Submit',onPressed: (){
                                  controller.submit();
                                 }, height: 43,width: double.infinity,),
                   const SizedBox(height: 10,),
                    CommonButton(text: 'Cancel',onPressed: (){
                      Get.back();
                    },
                    isFilled: false,
                    height: 43,
                    width: double.infinity,
                    ),
            
                   ],),
                 )
               
          ]),
               ),
       ),
  
    );
  }}

