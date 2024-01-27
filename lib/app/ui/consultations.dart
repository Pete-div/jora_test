import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jora_test_app/app/controllers/get_consul_controller.dart';
import 'package:jora_test_app/app/ui/view/widgets/consultation_list_widget.dart';
import 'package:jora_test_app/app/ui/view/widgets/consultations_header.dart';
import 'package:jora_test_app/app/ui/view/widgets/search_button.dart';
import 'package:jora_test_app/app/ui/view/widgets/text_widget.dart';

class Consultations extends GetView<ConsultationController> {
   Consultations({super.key});
  bool notification = true;
final TextEditingController searchContrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final consultationController = Get.put(ConsultationController());
    return  Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Obx(
        ()=> FloatingActionButton(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0), 
                                
                              ),
          onPressed: ()=>controller.getListOfUsers(),
          
        child:  controller.isLoading.value? const  Center(child: CircularProgressIndicator(color: Colors.black,)):
                     Image.asset('images/ic_baseline-plus.png'),
                  
                
              ),
      ),
      
      appBar:  AppBar(
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
        onTap: ()=> Get.back(),
        child: Image.asset('images/gg_menu-left.png')),
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
      body:
         Obx(
           ()=> Padding(
            padding:  const EdgeInsets.symmetric(horizontal:10.0),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 50,),
                SearchButton(searchContrl: searchContrl,
                  onChange: (word) {
                          if (word.isEmpty) {
                            consultationController.resetList();
                          } else {
                            
                            consultationController.searchUser(word);
                          }},
                          icon:  consultationController.searching.value ?Icons.search_outlined:Icons.search,
           
                  
                  
                ),
                const SizedBox(height: 30,),
         ...
               List.generate(
                consultationController.listOfUsers.value.length
                ,(index)
                {
                  final endDate = consultationController.listOfUsers.value[index].consultationDate!.subtract(Duration(minutes: 20));
                 final consultation =consultationController.listOfUsers.value[index];
                  return Padding(
                  padding:  const EdgeInsets.symmetric(vertical:10.0),
                  child:  ConsultationLists(
                    indez: index,
                    name: consultationController.listOfUsers.value[index].name!, 
                    specialization:consultation.specialisation!, 
                    time: '${DateFormat('hh:mm a').format(consultation.consultationDate!)}', 
                    date:  '${DateFormat.d().format(consultation.consultationDate!)}/${DateFormat('MM').format(consultation.consultationDate!)}/${DateFormat.y().format(consultation.consultationDate!)}',
                    consultationEnd:'${DateFormat('mm').format(endDate)}mins', 
                    img: consultation.image!),
                );}),
               
                
              
                
              
                  
              ],),
            ),
                   ),
         ),
    
    );
  }
  
}

