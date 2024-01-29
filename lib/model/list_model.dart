import 'package:flutter/material.dart';
class ListModel{
  String? title;
  double? income;
  IconData? iconData;

  ListModel({this.title, this.income,this.iconData});
}
List<ListModel> modelList=[
  ListModel(title: 'The Beekeeper',income: 7.4,iconData: Icons.production_quantity_limits),
  ListModel(title: 'Mean Girls',income: 7.3,iconData: Icons.people),
  ListModel(title: 'Wonka',income: 5.9,iconData: Icons.plus_one),
  ListModel(title: 'Migration',income: 5.2,iconData: Icons.grade),
  ListModel(title: 'Anyone But you',income: 4.8,iconData: Icons.h_mobiledata),
  ListModel(title: 'Poor Things',income: 3,iconData: Icons.inbox),
];