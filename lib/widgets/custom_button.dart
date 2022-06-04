import 'package:flutter/material.dart';
import 'package:stackit/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final double padding;
  final double radius;
  final Function()? onTap;
  final TextStyle? style;
  final Color? color;
  final Color? iconColor;
  final IconData? icon;
  final double? width;
  final Border? border;
  final Widget? suffixIcon;
  final bool disabled;

  const CustomButton({
    Key? key,
    @required this.title,
    this.disabled = false,
    this.padding = 15,
    this.radius = 10,
    this.onTap,
    this.style,
    this.color,
    this.icon,
    this.iconColor,
    this.width,
    this.suffixIcon,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        color: color ?? AppTheme.theme.primaryColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(padding),
              width: width != null ? width : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: border,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Row(
                      children: [
                        Icon(icon, color: iconColor),
                        SizedBox(width: 10),
                      ],
                    ),
                  Text(
                    title!,
                    style: style ??
                        TextStyle(
                          color: AppTheme.theme.colorScheme.onBackground,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
