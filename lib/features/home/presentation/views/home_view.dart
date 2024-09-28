import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/home_view_widgets/home_view_body.dart';
import 'package:movies_app/features/saved/presentation/views/saved_view.dart';
import 'package:movies_app/features/search/presentation/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

int index = 0;
List<Widget> screens = [
  const HomeViewBody(),
  SearchView(),
  const SavedView(),
];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF1C1B2A),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: index,
          onTap: (int x) {
            setState(() {
              index = x;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
          ],
        ),
        body: screens[index],
      ),
    );
  }
}
