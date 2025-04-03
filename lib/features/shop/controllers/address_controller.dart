import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui/MODEL_NEW/address_model.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/screens/personalization/adress/widgets/single_address.dart';
import 'package:ui/utils/popups/loaders.dart';
import '../../../data/repositories.authentication/address_repository.dart';
import '../../../utils/constants/sizes.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final isLoading = true.obs;
  final refreshData = true.obs;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final streetController = TextEditingController();
  final postalController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<List<AddressModel>> getAllAddresses() async {
    try {
      isLoading.value = true;
      final addresses = await addressRepository.getAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.isSelected,
          orElse: () => AddressModel.empty());
      isLoading.value = false;
      return addresses;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      final updatedAddress = AddressModel(
        id: newSelectedAddress.id,
        name: newSelectedAddress.name,
        city: newSelectedAddress.city,
        state: newSelectedAddress.state,
        street: newSelectedAddress.street,
        country: newSelectedAddress.country,
        postalCode: newSelectedAddress.postalCode,
        phoneNumber: newSelectedAddress.phoneNumber,
        isSelected: true, // ✅ Set new selection state
      );

      selectedAddress.value = updatedAddress;
      await addressRepository.updateSelectedField(updatedAddress.id, true);
      update();
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error in selection', message: e.toString());
    }
  }

  Future<dynamic> selectNewAddress(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SectionHeading(
                        title: 'Choose billing address',
                        showActionButton: false,
                      ),
                      const SizedBox(height: AppSize.spaceBtwSections),
                      FutureBuilder(
                          future: getAllAddresses(), builder: (_, snapshot) {

                            if(snapshot.connectionState == ConnectionState.waiting) {
                           return   const CircularProgressIndicator();
                            }

                            if(!snapshot.hasData || snapshot.data!.isEmpty){
                              return const Center(child: Text('No address added'));
                            }

                            if(snapshot.hasError){
                              return const Center(child: Text('Unexpected error!'));
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_,index)=> Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleAddress(
                                  address: snapshot.data![index],
                                  onTap: () {
                                     selectedAddress(snapshot.data![index]);
                                    Get.back();
                                  },
                                ),
                              ),
                            );

                      })
                    ],
                  )),
            ));
  }

  Future<void> addAddress() async {
    try {
      isLoading.value = true;

      await addressRepository.addAddress(
          nameController.text.trim(),
          cityController.text.trim(),
          stateController.text.trim(),
          countryController.text.trim(),
          streetController.text.trim(),
          postalController.text.trim(),
          phoneController.text.trim());

      refreshData.toggle();
      resetForm();
      Navigator.of(Get.context!).pop();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void resetForm() {
    nameController.clear();
    cityController.clear();
    stateController.clear();
    countryController.clear();
    streetController.clear();
    postalController.clear();
    phoneController.clear();
    formKey.currentState?.reset();
  }
}
