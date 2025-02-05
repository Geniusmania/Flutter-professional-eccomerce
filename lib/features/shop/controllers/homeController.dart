import 'package:get/get.dart';

class Homecontroller extends GetxController{

  static Homecontroller get instance => Get.find();

  final  carouselCurrentIndex =0.obs;



  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }
}