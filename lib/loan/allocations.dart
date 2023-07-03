import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';




class Applicationfragment extends StatefulWidget{
  const Applicationfragment({super.key});

  @override
  State<Applicationfragment> createState() => _ApplicationfragmentState();


}

class _ApplicationfragmentState extends State<Applicationfragment>{


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home:Sizer(
            builder: (context, orientation, deviceType){
              return Scaffold(
                  resizeToAvoidBottomInset: true,
                  body:  SingleChildScrollView(
                      child: SizedBox(
                        width:screenWidth ,
                        height:screenHeight ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[


                          ],
                        ),
                      )
                  )
              );
            }
        )
    );

  }
}