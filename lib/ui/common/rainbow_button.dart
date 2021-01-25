import 'package:flutter/material.dart';

class RainbowButton extends StatelessWidget {
  final Widget child;

  RainbowButton({this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 48,
      child: SizedBox(
        height: 48,
        child: RaisedButton(
          padding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff6ADA6F),
                  Color(0xffFFE769),
                ],
              ),
            ),
            child: Container(
              constraints: const BoxConstraints(minWidth: 88.0, minHeight: 48.0),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: child,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
