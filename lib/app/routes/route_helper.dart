import 'package:get/get.dart';
import 'package:jora_test_app/app/models/get_consultation_model.dart';
import 'package:jora_test_app/app/ui/consultations.dart';
import 'package:jora_test_app/app/ui/view/empty_consultations_state.dart';
import 'package:jora_test_app/app/ui/view/rate_seller.dart';
import 'package:jora_test_app/app/ui/view/view_consultation.dart';

class RouteHelper {
  
  static const String emptyConsultation = '/emptyConsultation';
  static const String consultations = '/consultations';
  static const String viewConsultations = '/viewConsultation';
  static const String sellerRating = "/sellerRating";
  //

    static String getEmptyConsultationScreen() => emptyConsultation;
  static String viewConsultationScreen() => viewConsultations;
  static String getConsultations() => consultations;
  static String getSellerRating() => sellerRating;

    static List<GetPage> routes = [
    GetPage(
        name: emptyConsultation,
        page: () =>  EmptyConsultations(),
        transition: Transition.cupertinoDialog),
      GetPage(
        name: consultations,
        page: () =>  Consultations(),
        transition: Transition.cupertinoDialog),
            GetPage(
        name: viewConsultations,
        page: () =>  const  ViewConsultations(),
        transition: Transition.cupertinoDialog),
            GetPage(
        name: sellerRating,
        page: () =>  RateSellerScreen(),
        transition: Transition.cupertinoDialog),
   ];

   }