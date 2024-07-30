import 'package:flutter/material.dart';
class Unitprovider extends ChangeNotifier{
  String Unit1 = "KG";
  String Unit2 = "G";
  String get getUnit1 => Unit1;
  String get getUnit2 => Unit2;
  TextEditingController unit1controller = new TextEditingController();
  TextEditingController unit2controller = new TextEditingController();
  void setunit1value(String value){
    Unit1 = value;
    notifyListeners();
  }
  void setunit2value(String value){
    Unit2 = value;
    notifyListeners();
  }
  void conversion(){
    double unit1value = double.parse(unit1controller.text);
    double unit2value = double.parse(unit2controller.text);
if(Unit1 ==  "KG" && Unit2 == "G"){
unit2controller.text = (unit1value*1000).toString();
}
else if(Unit1 == "G" && Unit2 == "KG"){
unit2controller.text = (unit1value/1000).toString();
}
  }
}