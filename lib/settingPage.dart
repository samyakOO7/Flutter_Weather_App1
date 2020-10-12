import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/main.dart';
import 'package:http/http.dart' as http;



class settingPage extends StatefulWidget {




  _settingPage createState() => _settingPage();
}
// ignore: camel_case_types
class _settingPage extends State<settingPage>
{
  String result="";
  int pageState=0;


  var res1="";




@override
  Widget build(BuildContext context) {

if(pageState==1)
  {
    Future.delayed(Duration.zero, ()async{
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(result: result)));});
  }
    // TODO: implement build
   return Scaffold(
     body: Container(

       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors:[ Color(0xffFDCA5E),Color(0xffFF935F),],
           begin:Alignment.topCenter,
           end:Alignment.bottomCenter,
         ),
       ),
       child: ListView(

         children: [
           Container(
             alignment: Alignment.topLeft,
           child:IconButton(
             icon: Icon(
               Icons.arrow_back_ios,

               size: 25,
             ),
            onPressed: (){
  Future.delayed(Duration.zero, ()async{
             Navigator.pop(context, MaterialPageRoute(builder: (context) =>  HomePage(result: result)));});
            },
           ),
           ),
           Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
             child:TextField(
               decoration: InputDecoration(
                 border: InputBorder.none,
                  
                 hintText: 'Enter a place to search'

               ),
            onSubmitted: (String str){

               setState(() {
                 result=str.toString();
                  pageState=1;
               });
            },
             )
           ),




           Divider(

           ),


         ],
       ),
     ),
   );

  }


}