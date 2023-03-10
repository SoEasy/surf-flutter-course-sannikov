import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/ui/common/icons.dart';

class SplashScreen extends StatefulWidget {
  final Future<void> isInitialized;
  const SplashScreen({
    Key? key,
    required this.isInitialized,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToNext();
    super.initState();
  }

  void _navigateToNext() {
    widget.isInitialized.then((_) {
      debugPrint('Переход на следующий экран');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            PlacesColors.splashGradientStart,
            PlacesColors.splashGradientEnd,
          ],
        ),
      ),
      child: Center(
        child: SightIconSplashscreen(),
      )
    );
  }
}
