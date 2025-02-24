// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ui/utils/formatters/formater_utility.dart';

// class Usermodel {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String phoneNumber;
//   final String profilePicture;
//   final String username;

//   Usermodel({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phoneNumber,
//     required this.profilePicture,
//     required this.username,
//   });

//   String get fullName => '$firstName $lastName';
//   String get formattedPhoneNo => AppFormatter.formatPhoneNumber(phoneNumber);

//   static List<String> nameParts(fullName) => fullName.split(" ");

//   static String generateUsername(fullName) {
//     List<String> nameParts = fullName.split(" ");
//     String firstName = nameParts[0].toLowerCase();
//     String lastName = nameParts[1].toLowerCase();

//     String camelCaseUsername = "$firstName$lastName";
//     String usernameWithPrefix = "tg_$camelCaseUsername";
//     return usernameWithPrefix;
//   }

//   static Usermodel empty() => Usermodel(
//       id: '',
//       firstName: '',
//       lastName: '',
//       username: '',
//       email: '',
//       phoneNumber: '',
//       profilePicture: '');

//   Map<String, dynamic> toJson() {
//     return {
//       'FirstName': firstName,
//       'LastName': lastName,
//       'email': email,
//       'phoneNumber': phoneNumber,
//       'profilePicture': profilePicture,
//     };
//   }

//   factory Usermodel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data()!;

//       return Usermodel(
//           id: document.id,
//           firstName: data['firstName'] ?? '',
//           lastName: data['lastName'] ?? '',
//           email: data['email'] ?? '',
//           phoneNumber: data['phoneNumber'] ?? '',
//           profilePicture: data['profilePicture'],
//           username: data['username']);
//     }
//     return Usermodel.empty();
//   }
// }
