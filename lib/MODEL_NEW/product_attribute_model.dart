class ProductAttributeModel {
  String? id;
  String? name;
  final List<String>? values;

  /// Constructor
  ProductAttributeModel({
     this.id,
    this.name,
    this.values,
  });

  /// Factory method to create a ProductAttributeModel from JSON
  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    final data = json;
    if(data.isEmpty){
      return ProductAttributeModel();
    }
    return ProductAttributeModel(
      name: data.containsKey('name')? data['name']:'',
      values: data['values'] != null ? List<String>.from(data['values']) : [],
    );
  }

  /// Converts ProductAttributeModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,
      '_id':id
    };
  }
}
