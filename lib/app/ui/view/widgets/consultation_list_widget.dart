import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test_app/app/controllers/get_consul_controller.dart';
import 'package:jora_test_app/app/controllers/view_consultation_controller.dart';
import 'package:jora_test_app/app/routes/route_helper.dart';
import 'package:jora_test_app/app/ui/view/widgets/text_widget.dart';

class ConsultationLists extends StatelessWidget {
  final String name;
  final String specialization;
  final String time;
  final String date;
  final String consultationEnd;
  final String img;
  final int indez;
  const ConsultationLists({
    super.key,
    required this.name,
    required this.specialization,
    required this.time,
    required this.date,
    required this.consultationEnd,
    required this.img,
    required this.indez,
  });
  
  @override
  Widget build(BuildContext context) {
    final consultationController = Get.put(ConsultationController());
    final viewConsultationController =Get.put(ViewConsultationController());
    return Container(
      padding: const EdgeInsets.only(top:10,bottom: 10,left: 10,right: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: 
         const  [
          BoxShadow(
            color: Color(0x141C2731),
            blurRadius: 6,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),],
    color: Colors.white
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Row(
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
                    child: Image.network(img),
                   ),
                   const SizedBox(width: 12,),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                WorkSanText(name.length >20 ?specialization.substring(0,20):name,
                
                weight: FontWeight.w600,size: 16,height: 18.7,color: Color(0xff2B2A29),),
               const  SizedBox(height: 5,),
                 WorkSanText(
                  
                  specialization.length >30 ?specialization.substring(0,27) +'...':specialization,
                 
                 weight: FontWeight.w400,size: 14,height: 16.2,color: Color(0xff2B2A29),textAlign: TextAlign.start,softWrap: true),
              ],),
            ],),
         
                    Obx(()=>
                     PopupMenuButton<int>(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                                        icon: viewConsultationController.isLoading.value ? CircularProgressIndicator(): const  Icon(Icons.more_horiz,color: Colors.black,),
                                        itemBuilder: (context)=>[
                             const PopupMenuItem<int>(
                                  value: 0,
                                  child: WorkSanText('View',weight: FontWeight.w400,size: 14,height: 24,),
                                ),
                                const PopupMenuItem<int>(
                                  value: 1,
                                  child: WorkSanText('Shop',weight: FontWeight.w400,size: 14,height: 24,),
                                ),
                                const PopupMenuItem<int>(
                                  value: 2,
                                  child: WorkSanText('Rate Seller',weight: FontWeight.w400,size: 14,height: 24,),
                                ),
                                
                                        ],
                                        onSelected: (value) {          
                                if (value == 0) {
                                  consultationController.indx.value = indez;
                                  viewConsultationController.getUserDetailsAndGotoViewConsultant(consultationController.listOfUsers.value,consultationController.indx.value);
                                 print("the index : $indez  :   ${consultationController.indx.value}" );
                                  Get.toNamed(RouteHelper.viewConsultations);
                                } else if (value == 1) {
                              
                                } else if (value == 2) {
                                       consultationController.indx.value = indez;
                                  viewConsultationController.getUserDetailsAndGotoRate(consultationController.listOfUsers.value,consultationController.indx.value);

                                
                                }}
                                      ),
                    )
        ],),
        const SizedBox(height: 15,),
           
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(children: [
             ConsultationItems(itemDetail: date,),
           const SizedBox(width: 8,),
          ConsultationItems(itemDetail: time,),
          ],),
         ConsultationItems(itemDetail: consultationEnd,),

    
        ],),
      ],),
    );
  }
}

class ConsultationItems extends StatelessWidget {
  final String itemDetail;
  const ConsultationItems({
    super.key,
    required this.itemDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: const EdgeInsets.only(top:9,bottom: 9,right: 10,left: 10),
                        decoration: BoxDecoration(border: Border.all(width:1 ,color:Colors.grey),borderRadius: BorderRadius.circular(10)),
                        child: WorkSanText(itemDetail,weight: FontWeight.w400,size: 14,height: 16.7,color: Color(0xff2B2A29),),
                      );
  }
}

