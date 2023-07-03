import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../loan/allocations.dart';
import '../loan/loanfragment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    return super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Loanfragment(),
    Applicationfragment(),
  ];

  @override
  void dispose() {
    return super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            useSafeArea: true,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed("/"),
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
        onWillPop: showExitPopup,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: Sizer(builder: (context, orientation, deviceType) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color.fromARGB(255, 63, 81, 181),
                  title: const Text(
                    "Welcome",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      color: Color.fromARGB(255, 255, 255, 255),
                      tooltip: 'Notifications',
                      onPressed: () {
                        // handle the press
                      },
                    ),
                  ],
                ),
                body: SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: _widgetOptions.elementAt(_selectedIndex))),
                bottomNavigationBar: BottomNavigationBar(
                  iconSize: 30,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.monetization_on),
                      label: 'Loan',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.note_alt),
                      label: 'My Application',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Color.fromARGB(255, 63, 81, 181),
                  onTap: _onItemTapped,
                ),
              );
            })));
  }
}
