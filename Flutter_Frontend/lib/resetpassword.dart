import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/UI/input_field.dart';
import 'package:untitled/home_page.dart';
import 'package:untitled/resetpassword.dart';
import 'package:untitled/UI/signup_page.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:intl/intl_browser.dart';

class reset_page extends StatefulWidget {
  @override
  _resetPageState createState() => _resetPageState();
}

class _resetPageState extends State<reset_page> {
  final controllerEmail = TextEditingController();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  // void doUserResetPassword() async {
  //   final ParseUser user = ParseUser(null, null, controllerEmail.text.trim());
  //   final ParseResponse parseResponse = await user.requestPasswordReset();
  //   if (parseResponse.success) {
  //     showDialog(context: context, 
  //     builder: (BuildContext context){
  //       return AlertDialog(
  //         title: const Text("Success"),
  //       content: const Text("Password reset instructions have been sent to email!"),
  //       actions: [
  //         TextButton(onPressed: (){
  //           Navigator.of(context).pop();
  //         }, child: const Text("Ok"))
  //       ],
  //     );
  //     }
  //     );
  //   } else {
  //     showDialog(context: context, 
  //     builder: (BuildContext context){
  //         return AlertDialog(
  //           title: const Text("Success"),
  //         content: Text(parseResponse.error!.message),
  //         actions: [
  //             TextButton(onPressed: (){
  //               Navigator.of(context).pop();
  //             }, child: const Text("Ok"))
  //           ],
  //         );
  //       }
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff6bceff),
                      Color(0xff6bceff)
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 22,
                          right: 32
                      ),
                      child: Text('Reset',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: const EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: controllerEmail,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.mail,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),

SizedBox(height: 20,),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen()));
                    },
                    child: Container(

                      height: 45,
                      width: 200,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff6bceff),
                              Color(0xFF00abff),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          )
                      ),
                      child: Center(
                        child: Text('Send Mail'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.pop(context);;
              },
              child: Container(
                height: 45,
                width: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff6bceff),
                        Color(0xFF00abff),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                    )
                ),
                child: Center(
                  child: Text('Login'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );

  }
}
