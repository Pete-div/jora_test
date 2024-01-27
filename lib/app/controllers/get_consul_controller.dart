
import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:jora_test_app/app/controllers/services/get_consultation_service.dart';
import 'package:jora_test_app/app/models/get_consultation_model.dart';
import 'package:jora_test_app/app/routes/route_helper.dart';
import 'package:jora_test_app/app/utilis/api_error_handler.dart';

class ConsultationController extends GetxController{
  RxBool _isLoading = false.obs;
RxInt _indx =0.obs;
      Rx<List<ListUser>> _listOfUsers = Rx<List<ListUser>>([]);

String? _name;
RxBool _searching = false.obs;
 // RxList<ListUsers> _searchedUser = Rx<List>[];
  Rx<List<ListUser>> _searchedUser = Rx<List<ListUser>>([]);
// get

 RxBool  get isLoading => _isLoading;
 RxBool  get searching => _searching;
String? get name => _name;
RxInt get indx => _indx;
Rx<List<ListUser>> get listOfUsers => _listOfUsers;
Rx<List<ListUser>> get searchedUser => _searchedUser;

 //

void updateLoading(RxBool status){
  _isLoading = status;
  update();
}
//

 void resetList() {
    _listOfUsers.value.clear();
    _listOfUsers.value.addAll(_searchedUser.value);
    update();
 
  }
  //
    searchUser(String keyWord) {
      Rx<List<ListUser>> user = Rx<List<ListUser>>([]);
    user.value = _searchedUser.value.where((user) {
      return user.name!.toLowerCase().contains(keyWord.toLowerCase());
    }).toList();
    _listOfUsers.value = user.value;
  }
 //
  void getListOfUsers(
   
  ) async {
     _isLoading.value = true;
    try {
      var res = await ConsultationService.getListOfUsers();
                        _name = listUsersFromJson(res.body)[0].name; 
          _listOfUsers.value = listUsersFromJson(res.body);
          _searchedUser.value = listUsersFromJson(res.body);
            update();
            _isLoading.value = false;
             Get.toNamed(RouteHelper.consultations);
      errorHandler(
          response: res,
          
          onSuccess: () {

          
          },
          onError: () {
     _isLoading.value = false;
           _listOfUsers.value = [];
          });
    } on SocketException catch (_) {
       SchedulerBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        'No Connectivity', 'Check Network')
      ;
      });
     _isLoading.value = false;
    } catch (e) {
     _isLoading.value = false;
     
    }
  }

}