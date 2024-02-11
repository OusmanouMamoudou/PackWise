import 'package:pack_wise/models/my_object.dart';

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
}
