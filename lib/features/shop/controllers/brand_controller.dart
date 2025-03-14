import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/brand_model.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/data/repositories.authentication/product_repository.dart';
import 'package:ui/utils/popups/loaders.dart';
import '../../../data/repositories.authentication/brand_repository.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();
  final brandRepository = Get.put(BrandRepository());

  final isLoading = true.obs;
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          brands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false; //
    }
  }

  Future<List<ProductModel>> getBrandProducts(String brandId)async{
    try{
      final product =await ProductRepository.instance.getProductsForBrand(brandId);
      return product;
    }catch(e){
      Loaders.errorSnackBar(title: 'Sorry!',message: e.toString());
      return [];
    }
  }

}
