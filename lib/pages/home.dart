import 'package:check_list_app/components/add_button.dart';
import 'package:check_list_app/components/deleted_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:check_list_app/components/home_screen.dart';
import 'package:check_list_app/components/history_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  GlobalKey bottomNavKey = GlobalKey();
  final List<Widget> _screens = [
    HomeScreen(),
    HistoryScreen(),
    DeletedScreen(),
  ];

  void setIndex(int index) {
    setState(() {
      _selectedIndex = index;
      // bottomNavKey.currentState?.setPage(index);
    });
  }

  Widget _title() {
    return const Text('Check List App');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: const Text(
          'C H E C K',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/27/b3/cd/27b3cd921580d05e966bb0b33e4f247a.jpg'),
              radius: 20.0,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Center(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/27/b3/cd/27b3cd921580d05e966bb0b33e4f247a.jpg'),
                    radius: 60.0,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.widgets),
                title: Text(
                  'Done List',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.disabled_by_default_sharp),
                title: Text(
                  'Delete List',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: CurvedNavigationBar(
          key: bottomNavKey,
          color: Color.fromARGB(255, 236, 248, 255),
          backgroundColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
          items: const [
            Icon(
              Icons.home,
              color: Color.fromRGBO(51, 226, 170, 1),
            ),
            Icon(
              Icons.widgets,
              color: Color.fromRGBO(51, 226, 170, 1),
            ),
            Icon(
              Icons.disabled_by_default_sharp,
              color: Color.fromRGBO(51, 226, 170, 1),
            ),
          ],
        ),
      ),
      floatingActionButton: AddButton(),
    );
  }
}
