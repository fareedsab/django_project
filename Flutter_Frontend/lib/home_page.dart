import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/screens/default_screen/default_screen.dart';
import 'package:untitled/screens/home_screen/home_screen.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/screens/search/search_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;
  List screensList = [
    const HomeScreen(),
     const DefaultScreen(),
    const DefaultScreen2(),
    const DefaultScreen1()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlueAccent,
      //
      //   elevation: 0,
      //   centerTitle: true,
      //   title:
      //   const Text(
      //     'Shoes Shop',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //
      //   ),
      //   // leading:  IconButton(
      //   //   onPressed: () {},
      //   //   icon: const Icon(Icons.menu_book_sharp),
      //   // ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         'assets/svg/search.svg',
      //         height: 20,
      //         width: 20,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      // ),
      //extendBody: true,
      body: screensList[currentIndex],
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: DotNavigationBar(
            marginR: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
            backgroundColor: Colors.black,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            currentIndex: currentIndex,
            dotIndicatorColor: Colors.lightBlueAccent,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                selectedColor: Colors.white,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.search),
                selectedColor: Colors.white,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.add_circle_outline_sharp),
                selectedColor: Colors.white,
              ),
              DotNavigationBarItem(
                icon: const Icon(Icons.person_outline_rounded),
                selectedColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
