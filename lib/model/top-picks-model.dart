class TopPicksModel{
  String? url;
  double? rating;
  String? title;
   TopPicksModel({this.url,this.rating,this.title});
}
final List<TopPicksModel>topPickList=[
  TopPicksModel(url:'https://i.ibb.co/XVYT7M7/movie1.jpg',title:'OMG 2',rating:8.2),
  TopPicksModel(url:'https://i.ibb.co/QCT5fMF/movie2.jpg',title:'barry',rating:8.2),
  TopPicksModel(url:'https://i.ibb.co/TbJ9cwZ/movie3.jpg',title:'Breaking Bad',rating:8.2),

];
