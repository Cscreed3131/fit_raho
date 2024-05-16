import 'package:fit_raho/src/home/screens/profile.dart';
import 'package:fit_raho/src/home/screens/routine.dart';
import 'package:fit_raho/src/home/widgets/profile_icon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      const Center(child: Text('Home')),
      const RoutineScreen(),
      const MemberProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Anubhav Kumar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
          actions: const [
            ProfileDialogBox(),
          ]),
      // drawer: const Drawer(),
      body: _buildScreens()[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 72.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        indicatorColor: Theme.of(context).colorScheme.secondary,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        labelBehavior: labelBehavior,
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            // icon: Icon(Icons.home_outlined),
            icon: const Icon(CupertinoIcons.house),
            selectedIcon: Icon(
              CupertinoIcons.house_fill,
              color: Theme.of(context).colorScheme.background,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: const Icon(Icons.schedule_outlined),
            selectedIcon: Icon(
              Icons.access_time_filled_rounded,
              color: Theme.of(context).colorScheme.background,
            ),
            label: "Routine",
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outlined),
            selectedIcon: Icon(
              Icons.person_2_rounded,
              color: Theme.of(context).colorScheme.background,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
