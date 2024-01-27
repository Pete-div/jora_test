import 'package:get/get.dart';
import 'package:jora_test_app/app/models/get_consultation_model.dart';
import 'package:jora_test_app/app/routes/route_helper.dart';

class ViewConsultationController extends GetxController{
  RxBool _isLoading = false.obs;
  String? _name;
  String? _specialization;
  String? _description;
  String? _about;
  String? _image;
  RxBool _submitting = false.obs;
//final List users = ListUser;

// get

String? get name => _name;
String? get specialization => _specialization;
String? get description => _description;
String? get about => _about;
RxBool  get isLoading => _isLoading;
RxBool  get submitting => _submitting;
String? get image => _image;



//  setter


//
void submit(){
  submitting.value = true;
   Get.snackbar('Success', 'Rating Submitted');
   submitting.value = false;
  Future.delayed(const  Duration(milliseconds: 300)).then((value) {
   
Get.toNamed(RouteHelper.emptyConsultation);

  } );
}

//
 void getUserDetailsAndGotoViewConsultant(List<ListUser> users,int indx)async{
 _isLoading.value = true;
 _name = users[indx].name; 
            _specialization = users[indx].specialisation; 
             _description = users[indx].emailAddress; 
              _about = users[indx].id; 
              _image = users[indx].image;
            update();
          Future.delayed(Duration(microseconds: 300)).then((value) {
              Get.toNamed(RouteHelper.viewConsultations);
            print('from contrl : $indx');
          });
            _isLoading.value = false;
             
 }

 void getUserDetailsAndGotoRate(List<ListUser> users,int indx)async{
 _isLoading.value = true;
     _name = users[indx].name; 
            _specialization = users[indx].specialisation; 
             _description = users[indx].emailAddress; 
              _about = users[indx].id; 
              _image = users[indx].image;
            update();
          Future.delayed(Duration(microseconds: 300)).then((value) {
           Get.toNamed(RouteHelper.sellerRating);

            print('from contrl : $indx');
          });
            _isLoading.value = false;
 }

}