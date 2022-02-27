import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/screens/home_screen.dart';
import 'package:flutter_netflix_responsive_ui/widgets/responsive.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen( key: PageStorageKey('homeScreen'),),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Comming Soon': Icons.queue_play_next,
    'Download': Icons.file_download,
    'More': Icons.menu
  };
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Responsive.isMobile(context)?
      BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex =index;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        unselectedItemColor: Colors.grey,
        items: _icons.map((title, icon) => MapEntry(
            title,
            BottomNavigationBarItem(
              label: title,
                icon: Icon(
              icon,
              size: 30,
              )
            )
        )
        ).values.toList(),
      ) : null  ,
    );
  }
}
