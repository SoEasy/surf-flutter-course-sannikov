import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/shared/theme_notifier.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/navigation/sight_bottom_navigator.dart';

/// Свич для темы с оповещалкой всего приложения
class ThemeSwitch extends StatefulWidget {
  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool _isDarkTheme = false;

  _handleSwitchTheme(bool value) {
    setState(() {
      _isDarkTheme = value;
      themeNotifier.notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isDarkTheme,
      onChanged: _handleSwitchTheme,
      activeTrackColor: Theme.of(context).buttonColor,
      activeColor: Colors.white,
      inactiveTrackColor: PlacesColors.textSecondary2Opacity,
    );
  }
}

/// Экран настроек
class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          PlacesTexts.settingsTitle,
          style: PlacesFonts.size18.copyWith(
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      bottomNavigationBar: SightBottomNavigator(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PlacesSizes.primaryPadding,
        ),
        child: Column(
          children: [
            SizedBox(
              height: PlacesSizes.doublePrimaryPadding,
            ),
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  Text(
                    PlacesTexts.settingsDarkTheme,
                    style: PlacesFonts.size16,
                  ),
                  Spacer(),
                  ThemeSwitch()
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  Text(
                    PlacesTexts.settingsShowTutorial,
                    style: PlacesFonts.size16,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(10),
                      ),
                      onPressed: () {},
                      child: SightIconInfo(
                        color: Theme.of(context).buttonColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
