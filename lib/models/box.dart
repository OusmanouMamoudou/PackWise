import 'package:pack_wise/models/my_object.dart';

class Box {
  int? id;
  String? name, description, date;
  List<MyObject>? objects;

  Box({this.id, this.objects, this.description, this.name, this.date});
}
