import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
final formKey =GlobalKey<FormState>();
  @override

  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  final GlobalKey<ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child:Form(
          key: formKey,
        child:ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3.5,
              decoration: BoxDecoration(
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
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 32,
                          right: 32
                      ),
                      child: Text('Sign Up',
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
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),


                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                          {
                            return null;
                          }
                        else
                          {
                            return null;
                          }

                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Address',
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
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
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),

                  // InkWell(
                  //   onTap: (){
                  //     Navigator.pushNamed(context, '/');
                  //   },
                  //   child: Container(
                  //     height: 45,
                  //     width: MediaQuery.of(context).size.width/1.2,
                  //     decoration: BoxDecoration(
                  //         gradient: LinearGradient(
                  //           colors: [
                  //             Color(0xff6bceff),
                  //             Color(0xFF00abff),
                  //           ],
                  //         ),
                  //         borderRadius: BorderRadius.all(
                  //             Radius.circular(50)
                  //         )
                  //     ),
                  //     child: Center(
                  //       child: Text('Sign Up'.toUpperCase(),
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
         Container(
           child: Center(
             widthFactor: 20,
             child: RaisedButton(onPressed: (){
               if(formKey.currentState!.validate())
                 {
                   final snackBar =SnackBar(content: Text('Enter Email'));
                   _scaffoldKey.currentState!.showSnackBar(snackBar);
                 }
             },child: Text("Sign Up",style: TextStyle(fontSize: 14,letterSpacing: 2.2,color:Colors.white)),
                 color: Colors.blue,

             padding: EdgeInsets.symmetric(horizontal: 50),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
           ),
         ),
  SizedBox(height: 10,),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have an account ?"),
                  Text("Login",style: TextStyle(color: Color(0xff6bceff)),),
                ],
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],

        ),
        ),
      ),
    );
  }
}