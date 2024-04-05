import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newpro/controller/sample_list_controller.dart';

class GridViewScreen extends StatelessWidget {
   GridViewScreen({super.key});

  final SampleListController sampleListController=
      Get.put(SampleListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          sampleListController.insertDataIntoList('Hello');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Grid List'),
      ),
      body:Obx((){
    return ListView.builder(
    itemCount: sampleListController.sampleList.length,
    itemBuilder: (context,index){
    final sampleValue=sampleListController.sampleList[index];
    return SampleWidget(value: index.toString(),
    );
    },
    );

    }),
    );
  }
}

/// Sample design widget
class SampleWidget extends StatelessWidget {
  String value;

  SampleWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.all(10),
      child: Text('Value Is $value'),
    );
  }
}