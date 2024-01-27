import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test_app/app/controllers/get_consul_controller.dart';
import 'package:jora_test_app/app/ui/view/widgets/consultations_header.dart';
import 'package:jora_test_app/app/ui/view/widgets/text_widget.dart';

import '../../routes/route_helper.dart';

class EmptyConsultations extends GetView<ConsultationController> {
   EmptyConsultations({super.key});

bool notification = true;
  @override
  Widget build(BuildContext context) {
    final controller =Get.put(ConsultationController());
    return  Scaffold(
      appBar: AppBar(leading: Image.asset('images/gg_menu-left.png'),
      title: const WorkSanText('Consultations',size: 24,weight: FontWeight.w500,height: 28,),
      actions: [
       Stack(children:[
         if(notification)
       const Positioned(
        right: 3,
      
        child:   CircleAvatar(radius: 3,backgroundColor: Colors.red,)),
       const  HeaderWidget(img: 'images/ic_baseline-notifications-none.png',)],),
      const SizedBox(width: 7,),
        const Padding(
          padding:  EdgeInsets.only(right:12.0),
          child:   HeaderWidget(img: 'images/clarity_shopping-cart-line.png',),
        ),

      ],
      ),
      body:  Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
const WorkSanText('No Consultation History',size: 20,weight: FontWeight.w600,height: 23,),
const SizedBox(height: 10,),
 WorkSanText('You have not had any consultations yet.',size: 14,weight: FontWeight.w400,height: 16,color: Colors.grey[600],),
const SizedBox(height: 10,),
 Obx(
   ()=> Container(
    margin: const EdgeInsets.symmetric(horizontal: 40),
    width:double.infinity ,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
      onPressed: (){
        controller.getListOfUsers();
      }, child:controller.isLoading.value? const  Center(child: CircularProgressIndicator(color: Colors.white,)): const WorkSanText('Book Appointment',size: 16,weight: FontWeight.w700,height: 18.77,color: Colors.white,)),
   ),
 )

        ],),),
    );
  }
}
