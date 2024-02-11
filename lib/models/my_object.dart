class MyObject {
  String? name;
  int? quantity;

  MyObject({this.name, this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }

  factory MyObject.fromJson(Map<String, dynamic> json) {
    return MyObject(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}
