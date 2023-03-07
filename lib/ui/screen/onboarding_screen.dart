import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/places_green_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool _isLastStep = false;
  int _currentPage = 0;

  _handleControllerChange(int page) {
    setState(() {
      _currentPage = page;
      _isLastStep = page == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            OnboardingTopBar(
              isVisible: !_isLastStep,
            ),
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: _handleControllerChange,
                    children: [
                      OnboardingContent(
                        icon: SightIconOnboardingFirst(),
                        title: PlacesTexts.onboardingTitle1,
                        subtitle: PlacesTexts.onboardingSubtitle1,
                      ),
                      OnboardingContent(
                        icon: SightIconOnboardingSecond(),
                        title: PlacesTexts.onboardingTitle2,
                        subtitle: PlacesTexts.onboardingSubtitle2,
                      ),
                      OnboardingContent(
                        icon: SightIconOnboardingThird(),
                        title: PlacesTexts.onboardingTitle3,
                        subtitle: PlacesTexts.onboardingSubtitle3,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 24,
                    left: 0,
                    right: 0,
                    child: OnboardingIndicator(
                      length: 3,
                      index: _currentPage,
                    ),
                  ),
                ],
              ),
            ),
            OnboardingBottomBar(
              isVisible: _isLastStep,
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingTopBar extends StatelessWidget {
  final bool isVisible;

  const OnboardingTopBar({
    Key? key,
    this.isVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isVisible
              ? TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(
                        PlacesSizes.primaryPadding,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    PlacesTexts.onboardingSkip,
                    style: PlacesFonts.size16Weight500
                        .copyWith(color: PlacesColors.primaryButtonLight),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class OnboardingBottomBar extends StatelessWidget {
  final bool isVisible;

  const OnboardingBottomBar({
    Key? key,
    this.isVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(
        vertical: PlacesSizes.primaryHalfPadding,
        horizontal: PlacesSizes.primaryPadding,
      ),
      child: isVisible
          ? PlacesGreenButton(
              onPressed: () {},
              child: Text(
                PlacesTexts.onboardingStart,
              ),
            )
          : SizedBox.shrink(),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;

  const OnboardingContent({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 58,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: PlacesFonts.size24WeightBold.copyWith(
              color: Theme.of(context).textTheme.headline1?.color,
            ),
          ),
          SizedBox(
            height: PlacesSizes.primaryHalfPadding,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: PlacesFonts.size14.copyWith(
              color: Theme.of(context).textTheme.subtitle1?.color,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingIndicatorDot extends StatelessWidget {
  final bool isActive;
  final bool isLast;

  const OnboardingIndicatorDot({
    Key? key,
    this.isActive = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: isLast ? 0 : 8,
      ),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive
            ? PlacesColors.primaryButtonLight
            : PlacesColors.textSecondary2Opacity,
      ),
    );
  }
}

class OnboardingIndicator extends StatelessWidget {
  final int index;
  final int length;

  const OnboardingIndicator({
    Key? key,
    required this.index,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < length; i += 1)
          OnboardingIndicatorDot(
            isActive: i == index,
            isLast: i == length - 1,
          ),
      ],
    );
  }
}
