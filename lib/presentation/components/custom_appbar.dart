import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final Widget? title;
  final VoidCallback? onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;

  const CustomAppBar({
    Key? key,
    this.height,
    this.title,
    this.padding,
    this.onPressed,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(left: 24.0, top: 50, right: 24, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixIcon ?? const SizedBox(),
          title ?? const SizedBox(),
          suffixIcon ?? const SizedBox(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 120);
}
