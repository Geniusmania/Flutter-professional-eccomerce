import 'package:get/get.dart';
import 'package:ui/data/repositories.authentication/banners_repository.dart';
import 'package:ui/utils/popups/loaders.dart';
import '../../../MODEL_NEW/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  final bannerRepository = Get.put(BannerRepository());
  final RxList<BannerModel> allBanners = <BannerModel>[].obs;


  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
@override
  void onInit() {
  fetchBanners();
    super.onInit();
  }
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final banners = await bannerRepository.fetchAllBanners();
      allBanners.assignAll(banners);
      isLoading.value = false;
    } catch (e) {
      print(e.toString());
      Loaders.errorSnackBar(title: 'Sorry', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}
