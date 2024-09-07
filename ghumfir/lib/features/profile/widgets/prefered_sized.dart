import 'package:flutter/material.dart';

class ResizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double preferredHeight;

  const ResizedAppBar(
      {super.key, required this.child, this.preferredHeight = 86.0});

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
