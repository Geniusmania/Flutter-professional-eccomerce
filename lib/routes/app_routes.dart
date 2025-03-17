
import 'package:get/get.dart';
import 'package:ui/features/authentication/login_and_signup/emailVerification/email_verification.dart';
import 'package:ui/features/authentication/login_and_signup/login/login.dart';
import 'package:ui/features/authentication/login_and_signup/pasword/reset_password.dart';
import 'package:ui/features/authentication/login_and_signup/register/register.dart';
import 'package:ui/features/authentication/onboarding/onboarding.dart';
import 'package:ui/features/screens/cart/cart.dart';
import 'package:ui/features/screens/checkout/checkout.dart';
import 'package:ui/features/screens/home/home_screen.dart';
import 'package:ui/features/screens/order/order.dart';
import 'package:ui/features/screens/personalization/profile/profile_screen.dart';
import 'package:ui/features/screens/personalization/settings/settings.dart';
import 'package:ui/features/screens/product_review/product_review.dart';
import 'package:ui/features/screens/wishlist/wish_list.dart';
import 'package:ui/routes/routes.dart';

class AppRoutes {
  static final pages =[
    GetPage(name: Routes.home, page: ()=> const HomeScreen()),
   // GetPage(name: Routes.store, page: ()=> const StoreScreen()),
    GetPage(name: Routes.favourite, page: ()=> const WishListScreen()),
    GetPage(name: Routes.settings, page: ()=> const SettingsScreen()),
    GetPage(name: Routes.productReviews, page: ()=> const ProductReview()),
    GetPage(name: Routes.checkout, page: ()=> const CheckoutScreen()),
    GetPage(name: Routes.cart, page: ()=> const CartScreen()),
    GetPage(name: Routes.order, page: ()=> const OrderScreen()),
    GetPage(name: Routes.signIn, page: ()=> const LoginScreen()),
    GetPage(name: Routes.profile, page: ()=> const ProfileScreen()),
    GetPage(name: Routes.onboarding, page: ()=> const Onboarding()),
    GetPage(name: Routes.signUp, page: ()=> const RegisterScreen()),
    GetPage(name: Routes.forgotPassword, page: ()=> const ResetPassword()),
    GetPage(name: Routes.verifyEmail, page: ()=> const EmailVerification()),
  ];
}