import 'package:flutter/material.dart';
import 'package:movie_app/models/pages/movies_page.dart';
import 'movie_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pageController = PageController(initialPage: 0);
  var selectedIndex = 0;
  void selectNavItem(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectNavItem(value);
              pageController.jumpToPage(value);
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: "Movie",
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey,
        ),
        body: PageView(
          controller: pageController,
          children: const [
            Center(
              child: MovieHome(),
            ),
            Center(
              child: MoviesPage(),
            ),
          ],
        ));
  }
}
