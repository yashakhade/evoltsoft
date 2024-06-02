import 'package:evoltsoft/utils/colors.dart';
import 'package:evoltsoft/view/charger/charger_screen.dart';
import 'package:evoltsoft/view/menu/menu_screen.dart';
import 'package:evoltsoft/view/sessions/sessions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigator_provider.dart';
import 'c_miles/c_miles_screen.dart';
import 'home/home_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SessionScreen(),
    ChargerScreen(),
    CmilesScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return Center(
            child: _widgetOptions.elementAt(provider.selectedIndex),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 118, 114, 114).withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Consumer<NavigationProvider>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'Session',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bolt),
                  label: 'Charger',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.directions_car),
                  label: 'Cmiles',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                ),
              ],
              currentIndex: provider.selectedIndex,
              backgroundColor: appThemeColor,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: provider.setIndex,
              iconSize: 20,
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
            );
          },
        ),
      ),
    );
  }
}
