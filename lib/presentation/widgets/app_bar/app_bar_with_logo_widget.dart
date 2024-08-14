import 'package:flutter/material.dart';
import 'package:tractian_exemple/presentation/themes/default_theme.dart';

class AppBarWithLogoWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarWithLogoWidget({this.height = 60, super.key});
  final double height;

  @override
  State<AppBarWithLogoWidget> createState() => _AppBarWithLogoWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppBarWithLogoWidgetState extends State<AppBarWithLogoWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColorDark,
      toolbarHeight: widget.height,
      title: Image.asset(
        'assets/logo.png',
        height: 20,
      ),
    );
  }
}
