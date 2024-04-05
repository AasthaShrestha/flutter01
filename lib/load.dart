void main(){

}
class ProcessData{
  String? networkData;

  ProcessData({this.networkData});

}
void getcombineddata() async{
  final id=loadIdFromLocal();
  print("the id is $id");
  final data=await getNetworkData(id);
  print("the id is ${data}");

}
int loadIdFromLocal(){
  return 10001;
}

Future<ProcessData> getNetworkData(int id){
  return Future.delayed(Duration(seconds:5), ()=>ProcessData(networkData: "This is network Data"));
}
Future<String> getStringfromNetwork(){
  return Future.delayed(Duration(seconds:3), ()=>'This is String');
}