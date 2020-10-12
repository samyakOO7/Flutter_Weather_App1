import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:weather_app/settingPage.dart';
import 'package:http/http.dart' as http;

import 'FarenheitPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
String res="london";
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(

        primarySwatch: Colors.blue,
      
      ),
      debugShowCheckedModeBanner: false,

     home:HomePage(result: res),
    
    );
  }
}



class HomePage extends StatefulWidget{

  HomePage({this.result});

   final String result;


  _HomePage createState() => _HomePage(result);

}



  class _HomePage extends State<HomePage> {

  var temp1;
  var temp2;
  var temp3;
  var temp4;
  var temp5;
  var temp7max;
  var temp8max;
  var temp9max;
  var temp10max;
  var temp11max;
  var temp12max;
  var temp7min;
  var temp8min;
  var temp9min;
  var temp10min;
  var temp11min;
  var temp12min;

  var temp;
  var description;
  var humidity;
  var up;
  var down;
  var currently;
  var wind;
  var name;
  var sunny;
  int i=0;

  String convert_state="metric";
  String set_text="°C";
  _HomePage(this.result);
  final String result;
  Future getWeather() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=$result&units=$convert_state&appid=799a8dbe87364d4c37b432c8c934794e');


    var results = jsonDecode(response.body);
    setState(() {
      this.temp=results['main']['temp'];
      this.currently=results['weather'][0]['main'];
      this.description=results['weather'][0]['description'];
      this.humidity=results['main']['humidity'];
      this.wind=results['wind']['speed'];
      this.up=results['main']['temp_min'];
      this.down=results['main']['temp_max'];
      this.name=results['name'];
    });
  }
  Future monthly() async {
  http.Response response1 = await http.get(
      'http://api.openweathermap.org/data/2.5/forecast?q=$result&units=$convert_state&appid=799a8dbe87364d4c37b432c8c934794e');
  var results1 = jsonDecode(response1.body);
  setState(() {

    this.temp2=results1['list'][1]['main']['temp'];
    this.temp3=results1['list'][2]['main']['temp'];
    this.temp4=results1['list'][3]['main']['temp'];
    this.temp5=results1['list'][4]['main']['temp'];
    this.temp7max=results1['list'][8]['main']['temp_max'];
    this.temp7min=results1['list'][8]['main']['temp_min'];
    this.temp8max=results1['list'][16]['main']['temp_max'];
    this.temp8min=results1['list'][16]['main']['temp_min'];
    this.temp9max=results1['list'][24]['main']['temp_max'];
    this.temp9min=results1['list'][24]['main']['temp_min'];
    this.temp10max=results1['list'][32]['main']['temp_max'];
    this.temp10min=results1['list'][32]['main']['temp_min'];


  });
}
  @override
  void initState() {

    super.initState();
    this.monthly();
    this.getWeather();

    setState(() {
      if(currently=="Sunny" || currently=="Clear")
        i=0;

      else if(currently=="Rain" || currently=="Thunderstorm" || currently=="Haze")
      {  i=1;
      }
      else if(currently=="Clouds")
      { i=2;
      }
      else
      {
        i=3;
      }
    });

  }

  // ignore: missing_return
  Widget build(BuildContext context) {

    setState(() {
      if(currently=="Sunny" || currently=="Clear")
        i=0;

      else if(currently=="Rain" || currently=="Thunderstorm" || currently=="Haze")
      {  i=1;
      }
      else if(currently=="Clouds" || currently=="Mist")
      { i=2;
      }
      else
      {
        i=3;
      }
    });





    double windowWidth = 0;
    double windowHeight = 0;




    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    DateTime now=new DateTime.now();
    DateTime t1=now.add(new Duration(days: 1));
    DateTime t2=now.add(new Duration(days: 2));
    DateTime t3=now.add(new Duration(days: 3));
    DateTime t4=now.add(new Duration(days: 4));
    DateTime t5=now.add(new Duration(days: 5));
    DateTime t6=now.add(new Duration(days: 6));
    DateTime t7=now.add(new Duration(days: 7));
    String f1=new DateFormat.E().format(now);
    String f2=new DateFormat.E().format(t1);
    String f3=new DateFormat.E().format(t2);
    String f4=new DateFormat.E().format(t3);
    String f5=new DateFormat.E().format(t4);
    String f6=new DateFormat.E().format(t5);
    String f7=new DateFormat.E().format(t6);

    DateTime time1=now.add(new Duration(hours: 3));
    DateTime time2=now.add(new Duration(hours: 6));
    DateTime time3=now.add(new Duration(hours: 9));
    DateTime time4=now.add(new Duration(hours: 12));



    String fm1= new DateFormat.j().format(time1);
    String fm2= new DateFormat.j().format(time2);
    String fm3= new DateFormat.j().format(time3);
    String fm4= new DateFormat.j().format(time4);

    String format2=new DateFormat.MMMEd().format(now);
final List<Color> colors=<Color>[Colors.orangeAccent,Colors.blueGrey,Colors.indigo,Colors.orangeAccent];

     return Scaffold(

        body:Container(

            height: windowHeight,
            width:windowWidth,

        decoration: BoxDecoration(
        color: colors[i],

        ),

        child:SingleChildScrollView(

          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [

              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(


                    child:IconButton(
                      onPressed: () {
                      Future.delayed(Duration.zero, () async {
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>  settingPage()));

                      });},

                      color: Colors.white,
                      icon:Icon(
                        Icons.settings,

                      ),
                      iconSize: 30.0,
                    ),

                    ),


                      Container(

                        child:Text("$format2",
                            style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                        ),

                    ),
                    Container(

                    alignment: Alignment.topLeft,
                      child:MaterialButton(
                        onPressed: () {
                          setState(() {
                            if(convert_state=="metric") {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  FarenheitPage(result: result,)));
                              set_text="°F";
                            }
                            else {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(result: result,)));
                              set_text = "°C";
                            }
                          });
                        },
                        child:Text("$set_text",
                          style: TextStyle(
                            fontSize: 25,
                            color:Colors.white,
                          ),

                        ),

                      ),

                    ),
                  ],
                ),

              ),
              Container(
                alignment: Alignment.topLeft,
                margin:EdgeInsets.fromLTRB(30, 50, 0, 0),
                  child:Text(name!=null?name.toString():"--",
                  style:TextStyle(
                    fontSize: 20,
                    color:Colors.white,

                  )),
                ),

            yourValI(context, i),
              Container(
                alignment: Alignment.topLeft,
                margin:EdgeInsets.only(left:20),
                  child:Text(temp!=null?temp.toString()+"°":"--",style: TextStyle(
                    fontSize: 75,
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  ),
              Container(
                alignment: Alignment.topLeft,
                child:Row(
                  children: [
                    Container(
                      margin:EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child:IconButton(
                        icon:Icon(
                          Icons.keyboard_arrow_up,
                          size: 25,
                          color: Colors.white,
                      ),
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child:Text(up!=null?up.toString()+"°":"--",style: TextStyle(
                        fontSize: 15,
                        color:Colors.white,
                      ),
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:IconButton(
                        icon:Icon(
                          Icons.keyboard_arrow_down,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child:Text(down!=null?down.toString()+"°":"--",style: TextStyle(
                        fontSize: 15,
                        color:Colors.white,
                      ),
                      ),
                    ),
                  ],
                ),

              ),
              Container(
                alignment: Alignment.topLeft,
                margin:EdgeInsets.fromLTRB(30, 20, 0, 0),
                child:Text(currently!=null?currently.toString():"-----",style: TextStyle(
                  fontSize: 20,
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin:EdgeInsets.fromLTRB(30, 10, 0, 10),
                child:Text(humidity!=null?"Humidity : "+humidity.toString()+"%":"-----",style: TextStyle(
                  fontSize: 15,
                  color:Colors.white,
                ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin:EdgeInsets.fromLTRB(30, 0, 0, 20),
                child:Text(wind!=null?"Wind Speed : "+wind.toString()+"%":"-----",style: TextStyle(
                  fontSize: 15,
                  color:Colors.white,
                ),
                ),
              ),
              Divider(
                thickness: 0,
                height: 10,
                color: Colors.white,
              ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 10, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Container(

                    child:Text("Now",style: TextStyle(
                      fontSize: 12,
                      color:Colors.white,
                    ),
                    ),
                  ),

                  Container(

                    child:Text("$fm1",style: TextStyle(
                      fontSize: 12,
                      color:Colors.white,
                    ),
                    ),
                  ),

                  Container(

                    child:Text("$fm2",style: TextStyle(
                      fontSize: 12,
                      color:Colors.white,
                    ),
                    ),
                  ),
                  Container(

                    child:Text("$fm3",style: TextStyle(
                      fontSize: 12,
                      color:Colors.white,
                    ),
                    ),
                  ),
                  Container(

                    child:Text("$fm4",style: TextStyle(
                      fontSize: 12,
                      color:Colors.white,
                    ),
                    ),
                  ),


                ],
              )
            ),

              Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Container(

                        child:Text("$temp",style: TextStyle(
                          fontSize: 18,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      Container(

                        child:Text("$temp2",style: TextStyle(
                          fontSize: 18,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),

                      Container(

                        child:Text("$temp3",style: TextStyle(
                          fontSize: 18,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      Container(

                        child:Text("$temp4",style: TextStyle(
                          fontSize: 18,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      Container(

                        child:Text("$temp5",style: TextStyle(
                          fontSize: 18,
                          color:Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),


                    ],
                  )
              ),
              Divider(
                thickness: 0,
                height: 10,
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 0, 20, 0),
                child: Column(
                  children: [
                Container(

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Container(
                        margin:EdgeInsets.only(right: 15),
                      child:IconButton(
                        icon:Icon(
                          Icons.keyboard_arrow_up,color: Colors.white,

                        ),
                        iconSize: 15,

                      )
                    ),
                    Container(
                        margin:EdgeInsets.only(right: 25),
                        child:IconButton(
                          icon:Icon(
                              Icons.keyboard_arrow_down,color: Colors.white,
                          ),
                          iconSize: 15,
                          color: Colors.white,
                        )
                    ),
                  ],
                ),),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin:EdgeInsets.only(right: 75),
                            child:Text("$f2",style: TextStyle(
                              fontSize: 18,
                              color:Colors.white,

                              fontWeight: FontWeight.bold,

                            ),
                            ),),
                          yourValB(context, i),

                          Container(
                            margin:EdgeInsets.only(left: 10),
                            child:Text("$temp7max    $temp7min",style: TextStyle(
                              fontSize: 18,
                              color:Colors.white,

                              fontWeight: FontWeight.bold,

                            ),
                            ),),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            margin:EdgeInsets.only(right: 70),
                            child:Text("$f3",style: TextStyle(
                              fontSize: 18,
                              color:Colors.white,

                              fontWeight: FontWeight.bold,

                            ),
                            ),),
                           yourValB(context, i),
                          Container(
                            margin:EdgeInsets.only(left: 10),
                            child:Text("$temp8max    $temp8min",style: TextStyle(
                              fontSize: 18,
                              color:Colors.white,

                              fontWeight: FontWeight.bold,

                            ),
                            ),),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(

                            margin:EdgeInsets.only(right: 70),
                            child:Text("$f4",style: TextStyle(
                              fontSize: 18,
                              color:Colors.white,

                              fontWeight: FontWeight.bold,

                            ),
                            ),),
                          yourValB(context, i),
                          Container(
                            margin:EdgeInsets.only(left: 10),
                            child:Text("$temp9max    $temp9min",style: TextStyle(
                              fontSize: 18,
                              color:Colors.white,

                              fontWeight: FontWeight.bold,

                            ),
                            ),),
                        ],
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin:EdgeInsets.only(right: 80),
                            child:Text("$f5",style: TextStyle(
                              fontSize: 18,
                              color:Colors.white,

                              fontWeight: FontWeight.bold,

                            ),
                            ),),
                          yourValB(context, i),

                          Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child:Text("$temp10max    $temp10min",style: TextStyle(
                              fontSize: 18,
                              color:Colors.white,

                              fontWeight: FontWeight.bold,

                            ),
                            ),),
                        ],
                      ),
                    ),






                  ],
                ),
              )
            ],
            ),

          ),
        ),

        );

  }
}
Widget yourValI(
    BuildContext context, int i) {
  if (i == 0) {
  return Container(
    margin: EdgeInsets.only(left: 180),
    alignment: Alignment.center,
            child:IconButton(icon: Icon(
              Icons.wb_sunny,size: 150,
              color: Colors.white,
            ),

          ),









    );
  }
  else if (i == 1) {
   return Container(
     margin: EdgeInsets.only(left: 180),
     alignment: Alignment.center,
      child:IconButton(icon: Icon(
        Icons.wb_cloudy,size: 150,
        color: Colors.white,
      ),

      ),
    );
  }
  else if (i == 2) {
    return Container(
      margin: EdgeInsets.only(left: 180),
      alignment: Alignment.center,
      child:IconButton(icon: Icon(
        Icons.wb_cloudy,size: 150,
        color: Colors.white,
      ),

      ),
    );
  }
  else {
   return Container(
     margin: EdgeInsets.only(left: 180),
     alignment: Alignment.center,
      child:IconButton(icon: Icon(
        Icons.wb_sunny,size: 150,
        color: Colors.white,
      ),

      ),
    );
  }
}
Widget yourValB(
    BuildContext context, int i) {
  if(i==0) {
   return Container(

margin: EdgeInsets.only(right: 50),
      child: IconButton(
        icon: Icon(
          Icons.wb_sunny, size: 25, color: Colors.white,

        ),
      ),);
  }
      else if(i==1)
        {
         return Container(
           margin: EdgeInsets.only(right: 50),
            child:IconButton(
              icon:Icon(
                Icons.wb_cloudy,size: 25,color: Colors.white,

              ),
            ),);

        }
      else if(i==2)
        {
         return Container(
           margin: EdgeInsets.only(right: 50),
            child:IconButton(
              icon:Icon(
                Icons.wb_cloudy,size: 25,color: Colors.white,

              ),
            ),);
        }
  else
  {
    return Container(
      margin: EdgeInsets.only(right: 50),
      child:IconButton(
        icon:Icon(
          Icons.wb_sunny,size: 25,color: Colors.white,

        ),
      ),);
  }
    }
