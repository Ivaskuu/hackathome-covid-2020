import 'package:covidelivery/pages/home/home_page.dart';
import 'package:covidelivery/pages/home/widgets/bottom_nav_bar.dart';
import 'package:covidelivery/pages/map/map_page.dart';
import 'package:covidelivery/states/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final List pages = [
    HomePage(),
    MapPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationState>(
        builder: (context, state, _) => Column(
          children: <Widget>[
            Expanded(child: pages[state.tab]),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}
