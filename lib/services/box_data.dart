import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pack_wise/models/box.dart';
import 'package:pack_wise/models/my_object.dart';

class BoxData extends ChangeNotifier {
  final List<Box> _boxes = [
    Box(
      id: 01,
      name: 'Cahiers',
      date: '01-05-24',
      description: 'Carton contenant des cahiers',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        )
      ],
    ),
    Box(
      id: 02,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        )
      ],
    ),
    Box(
      id: 03,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        )
      ],
    ),
    Box(
      id: 04,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        )
      ],
    ),
    Box(
      id: 05,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        )
      ],
    ),
    Box(
      id: 06,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        ),
      ],
    ),
    Box(
      id: 06,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        ),
      ],
    ),
    Box(
      id: 06,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        ),
      ],
    ),
    Box(
      id: 06,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        ),
      ],
    ),
    Box(
      id: 06,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        ),
      ],
    ),
    Box(
      id: 06,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        ),
      ],
    ),
    Box(
      id: 06,
      description: 'Carton contenant des cahiers',
      name: 'Cahiers',
      date: '01-05-24',
      objects: [
        MyObject(
          name: 'Chaussetes',
          quantity: 5,
        ),
      ],
    ),
  ];

  UnmodifiableListView<Box> get boxes {
    return UnmodifiableListView(_boxes);
  }

  int get boxesLength {
    return _boxes.length;
  }
}
