// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:ui/MODEL_NEW/product_model.dart';
// import 'package:ui/utils/popups/loaders.dart';
// import '../../../data/repositories.authentication/product_repository.dart';
// import '../../../utils/local_storage/local_storage.dart';
//
// class FavouriteController extends GetxController {
//   static FavouriteController get instance => Get.find();
//   final favorites = <String, bool>{}.obs;
//
//   @override
//   void onInit() {
//     initFavourites();
//     super.onInit();
//   }
//
//   Future<void> initFavourites() async {
//     final json = LocalStorage.instance.readData('Genius');
//     if (json != null) {
//       final storageFavourites = jsonDecode(json) as Map<String, dynamic>;
//
//       favorites.assignAll(
//           storageFavourites.map((key, value) => MapEntry(key, value as bool)));
//     }
//   }
//
//   bool isFavourite(String productId) {
//     return favorites[productId] ?? false;
//   }
//
//   void toggleFavouriteProduct(String productId) {
//     if(!favorites.containsKey(productId)){
//       favorites[productId]= true;
//       saveFavouritesToStorage();
//       Loaders.customToast(message: 'Product has been added to the wishlist');
//     }else{
// LocalStorage.instance.removeData(productId);
// favorites.remove(productId);
// saveFavouritesToStorage();
// favorites.refresh();
// Loaders.customToast(message: 'Product has been removed');
//     }
//   }
//
//   void saveFavouritesToStorage(){
//     final encodedFavourites = json.encode(favorites);
//     LocalStorage.instance.saveData('Genius', encodedFavourites);
//   }
//
//   Future<List<ProductModel>>favoriteProducts()async{
//     return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
//   }
// }
