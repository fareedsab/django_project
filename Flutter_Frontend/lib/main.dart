import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/UI/input_field.dart';
import 'package:untitled/models/login_model.dart';
import 'package:untitled/resetpassword.dart';
import 'package:untitled/UI/signup_page.dart';
import 'package:http/http.dart';
import 'package:untitled/screens/home/home.dart';
import 'package:untitled/userpref.dart';

//GLOBAL VARIABLE
String url = "http://10.0.2.2:8000/login/";
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UserPreferences.init();

  runApp(MyApp());
}

// Uri deleteUrl(String uname){
//   Uri finalUrl = Uri.http(url+uname+"/delete/","");
//   return finalUrl;
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Material App
      debugShowCheckedModeBanner: false,
      title: "Login App",

      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //StateFullWidget

  @override
  HomeScreenState createState() => HomeScreenState();
}


class HomeScreenState extends State<HomeScreen> {
  List<User> login = [];
  String test='';
  final usernamecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  static get http => null;
  @override
  void initState()
  {
    _retrieveLogin();
    super.initState();
  }

  @override
  void didChangeDependencies(){
    _retrieveLogin();
    super.didChangeDependencies();
  }
  _retrieveLogin() async
  {
    login = [];
    Response uri = await get(Uri.parse(url));
    List response = json.decode((uri.body));
    response.forEach((element) {
      login.add(User.fromMap(element));
    });
  }

  @override
  void setState(VoidCallback fn) {
  }
  Future<void> _refresh(){
    return Future.delayed(Duration(seconds: 0));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff6bceff), Color(0xff6bceff)],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 32, right: 32),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    padding: const EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: usernamecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: const EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      controller: passcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => reset_page()));
                    },
                    child: const Text('Forgot Password?'),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      bool temp=false;
                      for(var map in login)
                      {
                        debugPrint(map.username);
                        if(map.username.toLowerCase()==usernamecontroller.text.toLowerCase() && map.password==passcontroller.text)
                        {
                          temp=true;
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                        }
                      }
                      if(temp==false)
                      {
                        const snackBar=SnackBar(content:Text('Wrong Username/Password'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // showDialog(context: context, 
                        // builder: (BuildContext context){
                        //   return AlertDialog(
                        //   content: Text(login[0].username),
                        //   actions: [
                        //     TextButton(onPressed: (){
                        //       Navigator.of(context).pop();
                        //     }, child: const Text("Ok"))
                        //   ],
                        // );
                        // }
                        // );
                      }
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff6bceff),
                              Color(0xFF00abff),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Text(
                          'Login'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text("Don't have an account?"),
                  Text(
                    " Sign Up",
                    style: TextStyle(color: Color(0xff6bceff)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
