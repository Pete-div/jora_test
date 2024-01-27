import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test_app/app/controllers/view_consultation_controller.dart';
import 'package:jora_test_app/app/ui/view/widgets/text_widget.dart';

class ViewConsultations extends GetView<ViewConsultationController> {
  const ViewConsultations({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
         appBar:  AppBar(leading: GestureDetector(
          onTap: (){ 
            Get.back();
        
          },
          child: Image.asset('images/eva_arrow-back-outline.png')),
      title: const WorkSanText('View Consultations',size: 24,weight: FontWeight.w500,height: 28,color: Color(0xff2B2A29),),
      centerTitle: false,
    ),
    body: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 20,),
          Container(
             padding: const EdgeInsets.all(10),
               decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: 
              const [
              BoxShadow(
                color: Color(0x141C2731),
                blurRadius: 6,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),],
        color: Colors.white
          ),
          child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
        
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                       Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                        child: Image.network(controller.image!),
                       ),
                       const SizedBox(width: 12,),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                    WorkSanText(controller.name,weight: FontWeight.w600,size: 16,height: 18.7,color: Color(0xff2B2A29),),
                     const SizedBox(height: 5,),
                     WorkSanText(controller.specialization,weight: FontWeight.w400,size: 14,height: 16.2,color: Color(0xff2B2A29),),
                  ],),
                ],),],),
          ),
          const SizedBox(height: 35,),
         const  WorkSanText('Complaint',weight: FontWeight.w600,size: 16,height: 18.77,),
         const SizedBox(height: 8,),
           WorkSanText(controller.about,weight: FontWeight.w400,size: 14,height: 21,),
          const SizedBox(height: 60,),
          WorkSanText(controller.description,weight: FontWeight.w400,size: 14,height: 21,),
      
         const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom:30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   const  WorkSanText('Linked Documents',weight: FontWeight.w600,size: 16,height: 18.77,),
                   const  SizedBox(height: 8,),
             Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5,color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Image.asset('images/filetype.png'),
                    ),
                   const  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      WorkSanText('Land Document.pdf',weight: FontWeight.w600,size: 14,height: 16.8,),
                      SizedBox(height: 4,),
                       WorkSanText('100KB',weight: FontWeight.w400,size: 12,height: 15.6,color: Color(0xff878E99),),
                    ],),
            
                  ],),
                  Row(children: [
                    Image.asset('images/fluent_share-48-regular.png'),
                    const SizedBox(width: 5,),
                   Image.asset('images/ant-design_download-outlined.png'),
                  ],)
                  
      
                ],),
             ),
            
                   ],),
          )
        ],),
      ),
    
    );
  }
}