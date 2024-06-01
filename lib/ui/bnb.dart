import 'package:flightdetails/ui/page%201.dart';
import 'package:flightdetails/ui/search.dart';
import 'package:flutter/material.dart';

class bnb extends StatefulWidget {
  const bnb({super.key});

  @override
  State<bnb> createState() => _bnbState();
}

int currentIndex = 0;
final screens = [const page1(), const search()];

class _bnbState extends State<bnb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                print(currentIndex);
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: "Search"),
            ]),
        body: screens[currentIndex]);
  }
}
