import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ui/MODEL_NEW/user_model.dart';
import 'package:ui/models/usermodel/usermodel.dart';

class UserRepository extends GetxController{
  static UserRepository get instance=> Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

Future <void> saveUserRecord(
  UserModel user) async {
try {
  await _db.collection('Users').doc(user.id).set(user.toJson());
}on FirebaseException catch (e) {
  throw e.toString();
}

}}