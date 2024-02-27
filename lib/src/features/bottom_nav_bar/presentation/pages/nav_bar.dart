import 'package:flutter/material.dart';
import 'package:ssc/src/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:ssc/src/features/services/presentation/pages/services_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final pages = [
    const DashboardPage(),
    const ServicesPage(),
    const Scaffold(
      backgroundColor: Colors.red,
    ),
    const Scaffold(
      backgroundColor: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              canvasColor: Colors.transparent),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                  labelTextStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0C0C35),
                  )),
                  indicatorColor: Colors.transparent),
              child: NavigationBar(
                animationDuration: const Duration(seconds: 1),
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                backgroundColor: Colors.white,
                height: 75,
                selectedIndex: selectedIndex,
                onDestinationSelected: changePage,
                destinations: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: NavigationDestination(
                        selectedIcon: Image.asset(
                            "assets/images/dashboard_active.png",
                            color: Colors.indigo.shade800),
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Image.asset("assets/images/dashboard.png",
                              color: Colors.indigo.shade800),
                        ),
                        label: ""),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: NavigationDestination(
                        selectedIcon: Image.asset(
                            "assets/images/Services_01.png",
                            color: Colors.indigo.shade800),
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Image.asset(
                            "assets/images/Services_01.png",
                            color: Colors.indigo.shade800.withOpacity(0.4),
                          ),
                        ),
                        label: ""),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: NavigationDestination(
                        selectedIcon: Image.asset(
                            "assets/images/Settings_01.png",
                            color: Colors.indigo.shade800),
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Image.asset(
                            "assets/images/Settings_01.png",
                            color: Colors.indigo.shade800.withOpacity(0.4),
                          ),
                        ),
                        label: ""),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: NavigationDestination(
                        selectedIcon: Image.asset(
                            "assets/images/More_active.png",
                            color: Colors.indigo.shade800),
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Image.asset(
                            "assets/images/More_active.png",
                            width: 40,
                            height: 50,
                            fit: BoxFit.cover,
                            color: Colors.indigo.shade800.withOpacity(0.8),
                          ),
                        ),
                        label: ""),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
