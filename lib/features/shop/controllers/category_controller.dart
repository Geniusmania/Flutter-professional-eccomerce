import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/category_model.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/data/repositories.authentication/product_repository.dart';
import '../../../data/repositories.authentication/category_repository.dart';
import '../../../utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await categoryRepository.getAllCategory();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      Loaders.errorSnackBar(title: 'Sorry', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //get category or sub-category products
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      print("Calling repository for subcategories of category ID: $categoryId");  // ✅ Debugging
      final subcategories = await categoryRepository.getSubCategories(categoryId);

      print("Returned Subcategories Count: ${subcategories.length}");  // ✅ Debugging
      return subcategories;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Sorry!', message: e.toString());
      return [];
    }
  }


Future<List<ProductModel>>getCategoryProducts(String categoryId)async{
    try{
      final products = await ProductRepository.instance.getProductForCategory(categoryId);
      print("Returned Products Count: ${products.length}");
      return products;
    }catch(e){
      Loaders.errorSnackBar(title: 'Sorry!', message: e.toString());
      return [];
    }
}
}
