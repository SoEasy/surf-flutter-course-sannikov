import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/common/places_green_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool _isLastStep = false;

  _handleControllerChange(int page) {
    setState(() {
      _isLastStep = page == 2;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              OnboardingTopBar(isVisible: !_isLastStep,),
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      controller: _controller,
                      onPageChanged: _handleControllerChange,
                      children: [
                        Container(
                          color: Colors.red,
                        ),
                        Container(
                          color: Colors.blue,
                        ),
                        Container(
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 24,
                      left: 0,
                      right: 0,
                      child: OnboardingIndicator(
                        length: 3,
                        index: 2,
                      ),
                    ),
                  ],
                ),
              ),
              OnboardingBottomBar(isVisible: _isLastStep,)
            ],
          ),
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
    return Container(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isVisible ? TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.all(
                  PlacesSizes.primaryPadding,
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Пропустить',
              style: PlacesFonts.size16Weight500
                  .copyWith(color: PlacesColors.primaryButtonLight),
            ),
          ) : SizedBox.shrink(),
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
      child: isVisible ? PlacesGreenButton(
        onPressed: () {},
        child: Text('НА СТАРТ'),
      ) : SizedBox.shrink(),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
