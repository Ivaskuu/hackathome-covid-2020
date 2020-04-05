import 'package:covidelivery/misc/palette.dart';
import 'package:covidelivery/misc/text_size.dart';
import 'package:covidelivery/states/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationState>(
      builder: (context, navState, _) => Material(
        elevation: 6.0,
        color: Palette.scaffold_background,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
          ).copyWith(
            bottom: MediaQuery.of(context).padding.bottom,
            top: 4.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MenuButton(
                enabled: navState.tab == 0,
                onTap: () => navState.changeTab(0),
                icon: Icons.home,
                text: 'Home',
              ),
              MenuButton(
                enabled: navState.tab == 1,
                onTap: () => navState.changeTab(1),
                icon: Icons.map,
                text: 'Le mie richieste',
              ),
              MenuButton(
                enabled: navState.tab == 2,
                onTap: () => navState.changeTab(2),
                icon: Icons.settings,
                text: 'Impostazioni',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final bool enabled;
  final String text;
  final IconData icon;
  final Function() onTap;

  const MenuButton({
    Key key,
    @required this.enabled,
    @required this.text,
    @required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  color: enabled ? Palette.primary : Palette.grey_text,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: enabled ? Palette.primary : Palette.grey_text,
                    fontWeight: FontWeight.w700,
                    fontSize: TextSize.smol,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
