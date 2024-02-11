import 'package:pack_wise/models/my_object.dart';
import 'dart:convert';

class Box {
  String? name, description, date, id;
  List<MyObject>? objects;

  Box({this.id, this.objects, this.description, this.name, this.date});

  String getDate() {
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    return "$day-$month-$year";
  }

  int _getId(List<Box> boxes) {
    if (boxes.isEmpty) {
      return 1;
    }
    return boxes.length + 1;
  }

  String getIdFormated(List<Box> boxes) {
    final id = int.parse(_getId(boxes).toString());
    return id <= 9
        ? "000$id"
        : id <= 99
            ? "00$id"
            : id <= 999
                ? "0$id"
                : "$id";
  }

  // Convert a Box object into a Map object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'objects': objects != null
          ? jsonEncode(objects!.map((object) => object.toJson()).toList())
          : null,
    };
    return map;
  }

  // Create a Box object from a Map object
  factory Box.fromMap(Map<String, dynamic> map) {
    var decodedObjects =
        map['objects'] != null ? jsonDecode(map['objects']) : null;
    return Box(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      date: map['date'],
      objects: decodedObjects != null
          ? (decodedObjects as List<dynamic>)
              .map((object) => MyObject.fromJson(object))
              .toList()
          : null,
    );
  }
}
