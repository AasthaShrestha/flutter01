import 'package:flutter/material.dart';

import 'model/top-picks-model.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
        title:Text('Top Picks'),
    ),
    body: ListView.builder(
      itemCount:topPickList.length,
      itemBuilder: (context,index){
        final topPicks=topPickList[index];
      return Container(
        decoration:BoxDecoration(
          color: Colors.grey,
          borderRadius:BorderRadius.circular(20),
        ),
        child:Column(
          children: [
            Image.network(topPicks.url??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpVCtPR9Ik9W3Ugf41rmxElxOv2KD4xPpu-A&usqp=CAU'),
            SizedBox(
              height:30,
            ),
            Wrap(
              children:[
                Icon(Icons.generating_tokens),
                topPicks.rating!=null
                    ? Text('${topPicks.rating}')
                    :Text('0.0')
              ]
            )
          ],
        )
      );
    },),
    );
    }
}