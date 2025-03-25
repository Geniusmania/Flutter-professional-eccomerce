class AddressModel {
  final String id;
  final String name;
  final String city;
  final String state;
  final String street;
  final String country;
  final String postalCode;
  final String phoneNumber;
  late final bool isSelected;

  AddressModel(
      {required this.id,
      required this.name,
      required this.city,
      required this.state,
      required this.street,
      required this.country,
      required this.postalCode,
      required this.phoneNumber,
      this.isSelected = false});

  factory AddressModel.fromJson(Map<String, dynamic> data) {
    return AddressModel(
      id: data['_id'] ?? '',
      name: data['name'] ?? '',
      city: data['city'] ?? '',
      street: data['street'] ?? '',
      state: data['state'] ?? '',
      country: data['country'] ?? '',
      postalCode: data['postalCode'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      isSelected: data['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'city': city,
      'postalCode': postalCode,
      'phoneNumber': phoneNumber,
      'isSelected': isSelected,
    };
  }

  static AddressModel empty() {
    return AddressModel(
      id: '',
      name: '',
      city: '',
      state: '',
      street: '',
      country: '',
      postalCode: '',
      phoneNumber: '',
      isSelected: false, // Default to false
    );
  }

@override
  String toString() {
    // TODO: implement toString
    return '$street, $city ,$state, $postalCode, $country';
  }



}
