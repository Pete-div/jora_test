import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test_app/app/controllers/get_consul_controller.dart';
import 'package:jora_test_app/app/ui/view/widgets/text_formfield.dart';

class SearchButton extends GetView<ConsultationController> {
  const SearchButton({
    super.key,
    required this.searchContrl,
    required this.onChange,
    required this.icon,
  });

  final TextEditingController searchContrl;
  final Function(String)? onChange;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:5,bottom: 5,left: 8,right: 13),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      
      border: Border.all(width: 0.5,color: Color(0xffC2C7D6),
            )),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(
          child: CommonTextField(
            controller:searchContrl ,
            onChanged:onChange ,
            hintText: 'Search',
            prefixIcon: icon,
            
          ),
        ),
         Row(
    children: [
     
     Container(
      height:30,width: 0.5,color: Colors.grey[500],
     ),
       const SizedBox(width: 10,),
        Image.asset('images/filter-options-preferences-settings-svgrepo-com (1) 1.png'),
    
    ],
        ),
    
        
      ],),);
  }
}