import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
    body:Column(
    children:[
      SizedBox(height: 10),
      Center(child: Image.network("https://scontent.fjkr2-1.fna.fbcdn.net/v/t39.30808-6/385732520_1105206147527863_3394160267794434762_n.jpg?_nc_cat=111&cb=99be929b-8d691acd&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=C3T7GJOV14MAX_fzHZW&_nc_ht=scontent.fjkr2-1.fna&oh=00_AfDkFZugvOqSjgaN8c22fI9FK9rceNd3ngaG-AKpKtk0Gg&oe=65BAB99A",height: 250,width:250)),
      SizedBox(height: 10),
       Text('Name:Aastha Shrestha',style: TextStyle(fontSize:24,color: Colors.black87),
       ),
      SizedBox(height: 5),
      Text('Address:Pokhara,Nepal',style:TextStyle(fontSize:19),),
      SizedBox(height: 5),
      Text('Email:aasthashrestha008@gmail.com',style:TextStyle(fontSize:19),),
      SizedBox(height: 90),
      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
          ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure'
          ' dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat'
          ' non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur '
          'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud '
          'exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate '
          'velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia '
          'deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'
          ' ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea '
          'commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
          ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim '
          'id est laborum.',style:TextStyle(fontSize:19),),

    ],
     )
     );
   }
 }