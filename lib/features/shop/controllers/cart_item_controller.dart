import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/features/shop/controllers/variation_controller.dart';
import 'package:ui/utils/constants/enums.dart';
import 'package:ui/utils/local_storage/local_storage.dart';
import 'package:ui/utils/popups/loaders.dart';
import '../../../MODEL_NEW/cart_item_modrl.dart';


class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = Get.put(VariationController());

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      Loaders.customToast(message: 'Select products');
      return;
    }

    if (product.productType == ProductType.variable.name &&
        variationController.selectedVariation.value.id.isEmpty) {
      Loaders.customToast(message: 'Select variation');
      return;
    }

    if (product.stock < 1) {
      Loaders.customToast(message: 'Product is out of stock');
      return;
    }

    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }
    updateCart();
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price * item.quantity.toDouble());
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    LocalStorage.instance.saveData('cartItems', cartItemStrings);
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.name) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      productQuantityInCart.value = variationId.isNotEmpty
          ? getVariationQuantityInCart(product.id, variationId)
          : 0;
    }
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        removeFromCartDialog(index);
      }
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Loaders.customToast(message: 'Product removed from cart');
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  void loadCartItems() {
    final cartItemString = LocalStorage.instance.readData('cartItems');
    if (cartItemString != null) {
      cartItems.assignAll(cartItemString.map((item) =>
          CartItemModel.fromJson(item as Map<String, dynamic>)).toList());
      updateCartTotals();
    }
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.name) {
      variationController.resetSelectedAttribute();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? (variation.salePrice > 0.0 ? variation.salePrice : variation.price)
        : (product.salePrice > 0.0 ? product.salePrice : product.price);

    return CartItemModel(
      productId: product.id,
      title: product.title,
      quantity: quantity,
      price: price,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand?.name ?? '',
      selectedVariations: isVariation ? variation.attributeValues : null,
    );
  }

  int getProductQuantityInCart(String productId) {
    return cartItems
        .where((item) => item.productId == productId)
        .fold(0, (prev, item) => prev + item.quantity);
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    return cartItems.firstWhere(
          (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    ).quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
