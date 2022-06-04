import 'package:flutter/material.dart';

enum CustomShadowPosition {
  topLeft,
  top,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottom,
  bottomRight
}

class CustomShadow {
  late int alpha;
  late double elevation, spreadRadius, blurRadius;
  Offset? offset;
  CustomShadowPosition? position;
  Color? color;
  bool? darkShadow;

  CustomShadow(
      {double elevation = 8,
      double? spreadRadius,
      double? blurRadius,
      Offset? offset,
      CustomShadowPosition position = CustomShadowPosition.bottom,
      int? alpha,
      Color? color,
      bool darkShadow = false}) {
    this.spreadRadius = spreadRadius ?? elevation * 0.125;
    this.blurRadius = blurRadius ?? elevation * 2;
    this.alpha = alpha != null ? alpha : (darkShadow ? 100 : 36);
    this.elevation = elevation;
    this.offset = offset;
    this.position = position;
    this.color = color;
    this.darkShadow = darkShadow;

    if (offset == null) {
      switch (position) {
        case CustomShadowPosition.topLeft:
          this.offset = Offset(-elevation, -elevation);
          break;
        case CustomShadowPosition.top:
          this.offset = Offset(0, -elevation);
          break;
        case CustomShadowPosition.topRight:
          this.offset = Offset(elevation, -elevation);
          break;
        //TODO: Shadow problem
        case CustomShadowPosition.centerLeft:
          this.offset = Offset(-elevation, elevation * 0.25);
          break;
        case CustomShadowPosition.center:
          this.offset = Offset(0, 0);
          break;
        //TODO: Shadow problem
        case CustomShadowPosition.centerRight:
          this.offset = Offset(elevation, elevation * 0.25);
          break;
        case CustomShadowPosition.bottomLeft:
          this.offset = Offset(-elevation, elevation);
          break;
        case CustomShadowPosition.bottom:
          this.offset = Offset(0, elevation);
          break;
        case CustomShadowPosition.bottomRight:
          this.offset = Offset(elevation, elevation);
          break;
      }
    }
  }

  @override
  String toString() {
    return 'CustomShadow{alpha: $alpha, elevation: $elevation, spreadRadius: $spreadRadius, blurRadius: $blurRadius, offset: $offset, position: $position, color: $color, darkShadow: $darkShadow}';
  }
}
