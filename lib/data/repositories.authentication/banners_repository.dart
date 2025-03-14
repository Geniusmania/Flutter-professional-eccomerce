import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ui/MODEL_NEW/banner_model.dart';
import 'package:ui/features/shop/controllers/banner_controller.dart';

import '../../constant_api.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();


  Future<List<BannerModel>> fetchAllBanners()async{
    try{
      final response = await http.get(Uri.parse('${Api.URL}/api/banner'));
      if(response.statusCode == 200){
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => BannerModel.fromJson(json)).toList();
      }else{
        throw Exception('Failed to load categories: ${response.statusCode}');
      }

    }catch(e){
      print('Fetch error: $e');
      throw Exception('Error fetching categories: $e');
    }
        
        
  }



}