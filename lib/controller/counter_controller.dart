
import 'package:get/get.dart';

class CounterController extends GetxController{
  var counter=0.obs;
  var sampleList=[].obs;
  var isChecked = false.obs;

  increment(){
    counter++;
    print("The counter Increased is $counter");
  }

  decrement(){
    counter--;
    print("The counter decreased is $counter");
  }
  toggleCheckbox(bool newValue){
    isChecked.value=newValue;
  }
}
