import 'dart:convert';

import 'package:get/get.dart';

import '../../../utils/local_storage/local_storage.dart';

class FavouriteController extends GetxController{
  final favourites = <String, bool>{}.obs;


  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  Future<void> initFavourites()async {
    final json = LocalStorage.instance.readData('Genius');
    if(json != null){
      final storageFavourites = jsonDecode(json) as Map<String, dynamic>;

      favourites.assignAll(storageFavourites.map((key,value)=> MapEntry(key, value as bool)));
    }
  }

}