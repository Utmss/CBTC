import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unit_convertor/unit_provider.dart';
class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  @override
  Widget build(BuildContext context) {
    var listoption = [
      DropdownMenuItem(child: Text("KG"),value: "KG",),
      DropdownMenuItem(child: Text("G"),value: "G",),
      DropdownMenuItem(child: Text("MILLIGRAM"),value: "MILLIGRAM",),
      DropdownMenuItem(child: Text("TON"),value: "TON",),
      DropdownMenuItem(child: Text("POUND"),value: "POUND",),
      DropdownMenuItem(child: Text("OUNCE"),value: "OUNCE",),
      DropdownMenuItem(child: Text("STONE"),value: "STONE",),
      
    ];
    final unitprovider = Provider.of<Unitprovider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text("Unit Convertor",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body:Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 300,
              child: Row(children: [
                Expanded(child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: TextField(
                          controller: unitprovider.unit1controller,
                          decoration: InputDecoration(
                            hintText: 'Enter the value',
                            fillColor: Colors.deepPurple.shade100,
                            filled: true,
                          ),
                        )),
                        SizedBox(width: 10,),
                      Expanded(
                        
                         child: Container(
                          color: Colors.deepPurple.shade100,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                           child: Consumer<Unitprovider>(builder: (context,value,child){
                            return DropdownButton(items: listoption, onChanged: (s){
                           unitprovider.setunit1value(s!);
                           },
                           value: value.getUnit1,
                           );
                           },)
                         ),
                       )
                      ],
                    ),
                    SizedBox(height: 30,),
                     Row(
                      children: [
                        Expanded(child: TextField(
                          controller: unitprovider.unit2controller,
                          decoration: InputDecoration(
                            hintText: 'Enter the value',
                            fillColor: Colors.deepPurple.shade100,
                            filled: true,
                          ),
                        )),
                        SizedBox(width: 10,),
                      Expanded(
                         child: Container(
                          color: Colors.deepPurple.shade100,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                           child: Consumer<Unitprovider>(builder: (context,value,child){
                            return DropdownButton(items: listoption, onChanged: (s){
                           unitprovider.setunit2value(s!);
                           },
                           value: value.getUnit2,
                           );
                           },)
                         ),
                       )
                      ],
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        unitprovider.conversion();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("CONVERT",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    )
                  ],
                ))
              ],),
            )
          ],
        ),
      )
      
    );
  }
}