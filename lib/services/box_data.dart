import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pack_wise/models/box.dart';
import 'package:pack_wise/models/my_object.dart';
import 'package:pack_wise/services/data_base.dart';

class BoxData extends ChangeNotifier {
  //Adding new object management
  List<MyObject> _newObjects = [];

  UnmodifiableListView<MyObject> get newObjects {
    return UnmodifiableListView(_newObjects);
  }

  int get newObjectsLength {
    return _newObjects.length;
  }

  void addObject(String name, int? quantity) {
    _newObjects.add(MyObject(
      name: name,
      quantity: quantity,
    ));

    notifyListeners();
  }

  void clearObjects() {
    _newObjects = [];
  }

  void resetQuantity() {
    _quantity = 1;
  }

// Box List Management
  DatabaseHelper db = DatabaseHelper();
  List<Box> _boxes = [];

  UnmodifiableListView<Box> get boxes {
    return UnmodifiableListView(_boxes);
  }

  int get boxesLength {
    return _boxes.length;
  }

  void addBox(String name, String description, List<MyObject> objects) {
    DatabaseHelper().insertBox(
      Box(
        name: name.toUpperCase(),
        description: description,
        date: Box().getDate(),
        id: Box().getIdFormated(boxes),
        objects: objects,
      ),
    );
    getBox();
    notifyListeners();
  }

  void deleteBox(String id) async {
    await db.deleteBox(id);
  }

  void getBox() async {
    _boxes = await DatabaseHelper().getBoxList();
    notifyListeners();
  }

  //Quantity Management
  int _quantity = 1;

  void increaseQuantity() {
    _quantity++;
    if (_quantity == 20) {
      _quantity = 1;
    }
    notifyListeners();
  }

  void decreaseQuantity() {
    _quantity--;
    if (_quantity < 1) {
      _quantity = 1;
    }
    notifyListeners();
  }

  void addQuantity(String value) {
    _quantity = int.parse(value);
    notifyListeners();
  }

  int get getQuantity {
    return _quantity;
  }

  //Waiting to fetch data
  bool isFetching = true;

  void fetching() {
    isFetching = true;
    Future.delayed(const Duration(seconds: 3), () {
      isFetching = false;
      notifyListeners();
    });
  }
}
