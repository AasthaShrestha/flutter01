import 'package:flutter/material.dart';
import 'model/top-picks-model.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({Key? key}) : super(key: key);

  // New method to create the Watchlist Container
  Widget buildWatchlistContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Colors.blueAccent,
          ),
          SizedBox(width: 5),
          Text(
            'Watchlist',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Top Picks'),
      ),
      body: Container(
        height: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: topPickList.length,
          itemBuilder: (context, index) {
            final topPicks = topPickList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          topPicks.url ??
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpVCtPR9Ik9W3Ugf41rmxElxOv2KD4xPpu-A&usqp=CAU',
                        ),

                      ],
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow,
                        ),
                        topPicks.rating != null
                            ? Text(
                          '${topPicks.rating}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                            : Text('0.0'),
                      ],
                    ),
                    SizedBox(height: 10),
                    topPicks.title != null
                        ? Text(
                      topPicks.title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                        : Text('Title'),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        height: 40,
                        child: buildWatchlistContainer(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
