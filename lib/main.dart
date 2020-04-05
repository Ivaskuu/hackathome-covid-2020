import 'package:covidelivery/misc/palette.dart';
import 'package:covidelivery/pages/home/home_page.dart';
import 'package:covidelivery/states/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavigationState(context),
        ),
      ],
      child: MaterialApp(
        title: 'CoviDelivery',
        theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Palette.scaffold_background,
          textTheme: GoogleFonts.googleSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
