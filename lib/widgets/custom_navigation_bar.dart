import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomNavigationBar extends StatelessWidget {
  final int? selectedIndex;
  final double? iconSize;
  final Color? backgroundColor;
  final bool? showElevation;
  final Duration? animationDuration;
  // final List<CustomBottomNavigationBarItem>? items;
  final ValueChanged<int>? onItemSelected;
  final MainAxisAlignment? mainAxisAlignment;
  final double? itemCornerRadius;
  final double? containerHeight;
  final Curve? curve;
  final Color? selectedItemOverlayColor;
  final TextStyle? textStyle;

  CustomNavigationBar({Key? key, this.selectedIndex, this.iconSize, this.backgroundColor, this.showElevation, this.animationDuration, this.onItemSelected, this.mainAxisAlignment, this.itemCornerRadius, this.containerHeight, this.curve, this.selectedItemOverlayColor, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = (backgroundColor == null) ? Theme.of(context).bottomAppBarColor : backgroundColor;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation!)
            BoxShadow(
              color: Colors.black.withAlpha(16),
              blurRadius: 8,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        ),
      ),
    );
  }
}
