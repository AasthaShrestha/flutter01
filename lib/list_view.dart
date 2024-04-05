import 'package:flutter/material.dart';
import 'package:newpro/model/list_model.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(

        itemCount: modelList.length,
        itemBuilder: (BuildContext context,int index) {
          final modelData=modelList[index];
          return ListTile(
        leading: Icon(modelData.iconData),
        title: Text('${modelData.title}'),
        subtitle: Text('\$ ${modelData.income}M'),
      );
    },
      ),
    );
  }
}
